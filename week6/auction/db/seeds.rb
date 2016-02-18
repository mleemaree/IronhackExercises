# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


tina = Customer.create(name:'Tina', email: 'tina@tina.com')
rob = Customer.create(name:'Rob', email: 'rob@rob.com')
geoff = Customer.create(name:'Geoff', email: 'geoff@tina.com')
danny = Customer.create(name:'Danny', email: 'Danny@rob.com')

whistle = Product.create(title: 'whistle', description: 'don\'t care', deadline: DateTime.now)
iron = Product.create(title: 'iron', description: 'don\'t care', deadline: DateTime.now)
bucket = Product.create(title: 'bucket', description: 'don\'t care', deadline: DateTime.now)
phone = Product.create(title: 'phone', description: 'don\'t care', deadline: DateTime.now)
shoes = Product.create(title: 'shoes', description: 'don\'t care', deadline: DateTime.now)
sweater = Product.create(title: 'sweater', description: 'don\'t care', deadline: DateTime.now)

tina.products.push(whistle)
tina.products.push(phone)
geoff.products.push(sweater)
danny.products.push(bucket)

