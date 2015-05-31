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

		if (Product.exists?(name: params[:product_name]))
			product = Product.find_by_name(params[:product_name])
			exists = true

			total = 0

			product.sub_products.each do |sub_product|
				total += sub_product.price
			end
		else
			exists = false
		end

		respond_to do |format|
			format.json {
				if exists
					render :json => {:total => total}.to_json, :status => 200, :content_type => 'json'
				else
					render :nothing => true, :status => 200, :content_type => 'json'
				end
			}
		end
		
	end

end
