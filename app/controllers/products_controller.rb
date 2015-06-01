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
		
	end

end
