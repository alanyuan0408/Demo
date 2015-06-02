# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


if !(Product.exists?(name: 'Apples'))
	Product.create(name: 'Apples', price: 120)
end
if !(Product.exists?(name: 'Oranges'))
	Product.create(name: 'Oranges', price: 100)
end
if !(Product.exists?(name: 'Peach'))
	Product.create(name: 'Peach', price: 150)
end

orange = Product.find_by_name('Apples')
orange.sub_products.create(name: "Sub_part1", price: 21)
orange.sub_products.create(name: "Sub_part2", price: 31)
orange.sub_products.create(name: "Sub_part3", price: 41)

apple = Product.find_by_name('Oranges')
apple.sub_products.create(name: "Sub_part1", price: 22)
apple.sub_products.create(name: "Sub_part2", price: 32)
apple.sub_products.create(name: "Sub_part3", price: 42)

peach = Product.find_by_name('Peach')
peach.sub_products.create(name: "Sub_part1", price: 23)
peach.sub_products.create(name: "Sub_part2", price: 33)
peach.sub_products.create(name: "Sub_part3", price: 43)

if !(User.exists?(name: 'Jerry'))
	User.create(name: 'Jerry')
end

jerry = User.find_by_name('Jerry')
jerry.followers.create(name: "Allan", following: "Jerry")
jerry.followers.create(name: "Jackie", following: "Jerry")
jerry.followers.create(name: "James", following: "Jerry")

=begin
if !(Follower.exists?(name: 'Allan'))
	jerry = User.find_by_name('Jerry')
	Follower.create(name: 'Allan', user_id: jerry.user_id)
end

if !(Follower.exists?(name: 'Jackie'))
	Follower.create(name: 'Jackie', user_id: User.find_by_name('Jerry').user_id)
end

if !(Follower.exists?(name: 'James'))
	Follower.create(name: 'James', user_id: User.find_by_name('Jerry').user_id)
end
=end