# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([
    
{username: "user1", email:"user1@mail.com", password:"123", admin: true},
{username: "user2", email:"user2@mail.com", password:"123", admin: false},
{username: "user3", email:"user3@mail.com", password:"123", admin: false},
{username: "user4", email:"user4@mail.com", password:"123", admin: false}
])
# problem with active storage wont create products i might be defining the image path incorrectly
# Product.create(
#     [
#         {name: "coffee maker", description: "a greate coffee maker only 10 dollars", price: 10, image: "coffee maker.jpg", user_id: 2},
#         {name: "Shoe", description: "shoes you can wear", price: 10, image: "hoka_one_one.jpg", user_id: 2 }
#     ]
# )

 Category.create([
    {name: "Does not exist"},
    {name: "Garments"},
    {name: "Clothing"},
    {name: "Electronics"},
    {name: "Computer"},
    {name: "shoes"},
    {name: "outlet"},
    {name: "Laptop"},
    {name: "garment"},
     {name: "living"},
     {name: "necklace"},
     {name: "jewlery"},
     {name: "furniture"},
     {name: "home"},
     {name: "Business"},
     {name: "technology"}
    ])

 