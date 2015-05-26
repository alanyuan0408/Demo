class ProductsController < ApplicationController
	skip_before_action :verify_authenticity_token

	def call_product

	end

	def request_product
		respond_to do |format|
			@products = Product.all

			format.html {
				render :partial => "products/partial/list_partial"
			}
			format.json {

				render :json => @products
			}
		end
	end
end
