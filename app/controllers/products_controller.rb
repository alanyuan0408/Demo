class ProductsController < ApplicationController

	def call_product

	end

	def requrest_product

		respond_to do |format|
			@products = Product.all

			format.html {
				render :partial => "products/partial/list_partial"
			}
			format.json {
				puts @products
				render :json => @products
			}
		end

	end
end
