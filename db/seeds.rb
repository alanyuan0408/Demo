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
orange.sub_products.create(name: "Sub_part1", price: 20)
orange.sub_products.create(name: "Sub_part2", price: 30)
orange.sub_products.create(name: "Sub_part3", price: 40)

apple = Product.find_by_name('Oranges')
apple.sub_products.create(name: "Sub_part1", price: 20)
apple.sub_products.create(name: "Sub_part2", price: 30)
apple.sub_products.create(name: "Sub_part3", price: 40)

peach = Product.find_by_name('Peach')
peach.sub_products.create(name: "Sub_part1", price: 20)
peach.sub_products.create(name: "Sub_part2", price: 30)
peach.sub_products.create(name: "Sub_part3", price: 40)