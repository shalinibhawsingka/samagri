# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name:"foo bar", email:"foobar@gmail.com", is_admin: true)
User.create(name:"abc xyz", email:"abcxyz70030@gmail.com", is_admin: false)
User.create(name:"Tan Sen", email:"tansen@gmail.com", is_admin: false)
User.create(name:"Palash Bera", email:"pbera@kreeti.com", is_admin: true)
User.create(name:"Mr Bajaj", email:"iambajaj@gmail.com", is_admin: false)

cat1 = Category.create(name:"Mobiles", buffer: 5, min_quan: 2)
cat2 = Category.create(name:"T Shirts", buffer: 5, min_quan: 2)

b1 = Brand.create(name:"Xiomi")
b2 = Brand.create(name:"Zara")

e1 = Employee.create(name:"emp1", email:"emp@abc.com", status:true)
e2 = Employee.create(name:"emp2", email:"emp2@xyz.com", status:false)

Item.create(name: "Collar neck T Shirt", brand_id: b2.id, category_id: cat2.id, employee_id: nil, status: false, notes: "please check out this tshirt")
Item.create(name: "Rounded Neck", brand_id: nil, category_id: cat2.id, employee_id: e1.id, status: true, notes: "")
Item.create(name: "Redmi Note 5 Pro", brand_id: nil, category_id: cat1.id, employee_id: nil, status: true, notes: "")
Item.create(name: "Exclusive T shirt", brand_id: nil, category_id: cat2.id, employee_id: nil, status: false, notes: "")

