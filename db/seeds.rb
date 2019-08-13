# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")
puts "Destroy ingredients"
Ingredient.destroy_all if Rails.env.development?

puts "Destroy Cocktails"
Cocktail.destroy_all if Rails.env.development?

puts "Create ingredients"

url='https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

ingredient_serialized = open(url).read
ing = JSON.parse(ingredient_serialized)

ing['drinks'].each do |realdeal|
  val = Ingredient.create(name: realdeal['strIngredient1'])
  puts "create #{val.name}"
end
