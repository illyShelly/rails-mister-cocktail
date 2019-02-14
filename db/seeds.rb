require 'open-uri'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Destroy Cocktails"
Cocktail.destroy_all

puts "Destroy ingredients"
Ingredient.destroy_all

puts "Creating ingredients"

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
drinks = JSON.parse(open(url).read)

drinks["drinks"].each do |ingredient|
  spirit = ingredient["strIngredient1"]
  # create new Ingredient
  # binding.pry
  ingredient = Ingredient.create(name: spirit)
  puts "Creating #{ingredient.name}"
end


# {
#   "drinks": [
#     {
#       "strIngredient1": "Light rum"
#     },
#     {
#       "strIngredient1": "Applejack"
