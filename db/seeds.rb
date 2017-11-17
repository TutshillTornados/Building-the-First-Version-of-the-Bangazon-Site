# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ProductType.create([
  { product_type_name: "Electronics" }
])

ProductType.create([
  { product_type_name: "Clothing" }
])

ProductType.create([
  { product_type_name: "Garden & Outdoors" }
])

ProductType.create([
  { product_type_name: "Toys & Games" }
])

ProductType.create([
  { product_type_name: "Home & Kitchen" }
])