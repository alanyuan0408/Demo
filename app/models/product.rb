class Product < ActiveRecord::Base
	has_many :sub_products
end
