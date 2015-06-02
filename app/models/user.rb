class User < ActiveRecord::Base
	has_many :followers
end
