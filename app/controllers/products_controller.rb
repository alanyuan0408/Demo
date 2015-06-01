require 'json'

class ProductsController < ApplicationController
	
	def call_product

	end

	def request_product
		@all_products = Product.all
		respond_to do |format|
  			format.html {render partial: 'products/partial/list_partial'}
  			format.json {render json: @all_products}
		end

	end

	def request_sum
		@product = Product.find_by name: params[:product_name]
		
		#if product exists
		if @product
			total_price = 0
			@sub_p = @product.sub_products
			@sub_p.each do |element|
				total_price += element.price
			end

			new_hash = {:total => total_price}
			respond_to do |format|
				format.json {
					render json: JSON.generate(new_hash)
				}
			end

		#if product does not exist
		else
			respond_to do |format|
			format.json {
					render nothing: true
				}
			end
		end
	
	end
end
