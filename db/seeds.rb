require 'open-uri'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Destroy ingredients"
Ingredient.destroy_all

puts "Destroy Cocktails"
Cocktail.destroy_all

puts "Destroy Reviews"
Review.destroy_all

puts ""

puts "Creating ingredients"
puts "----------------"

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
drinks = JSON.parse(open(url).read)

drinks["drinks"].each do |ingredient|
  spirit = ingredient["strIngredient1"]
  # create new Ingredient
  # binding.pry
  ingredient = Ingredient.create(name: spirit)
  puts "Creating #{ingredient.name}"
end


puts "Cocktails creating"
puts "----------------"

# links for image does not work from cloudinary -> use uni https://source.unsplash.com/500x400/?cocktail
bloody = Cocktail.create!(name: "Bloody mary", photo: "https://res.cloudinary.com/illydev/image/upload/c_fill,h_400,w_1200/v1550518446/whbdnekravftxbmc0frl.jpg")
# cocktail has many ingredients -> needs to interate
mochito = Cocktail.create!(name: "Mochito", photo: "https://res.cloudinary.com/illydev/image/upload/c_fill,h_400,w_1200/v1550518762/l8jclqoxferuqqtt5koa.jpg")

rum = Cocktail.create!(name: "Dark Rum", photo: "https://res.cloudinary.com/illydev/image/upload/c_fill,h_400,w_1200/v1550519080/rfbn826i9jyt8en8bbyl.jpg")

blue = Cocktail.create!(name: "Blue lagoon", photo: "s0zjqkcmrdp0xvixrvvl.jpg")

manhattan = Cocktail.create!(name: "Manhattan", photo: "https://res.cloudinary.com/illydev/image/upload/c_fill,h_400,w_1200/v1550519655/rqghca0wvcarialbrsel.jpg")

old_fashioned = Cocktail.create!(name: "Old Fashioned", photo: "https://res.cloudinary.com/illydev/image/upload/c_fill,h_400,w_1200/v1550519865/tm7mggy9optmonai426e.jpg")

shroomy = Cocktail.create!(name: "Shroomy Cocktail", photo: "https://res.cloudinary.com/illydev/image/upload/c_fill,h_400,w_1200/v1550519950/pscerkkthypapw2y752n.jpg")

martini = Cocktail.create!(name: "Martini", photo: "https://res.cloudinary.com/illydev/image/upload/c_fill,h_400,w_1200/v1550519996/jefyxpkzuysdarmhfelf.jpg")

secret = Cocktail.create!(name: "Secret", photo: nil)

 #<Cocktail id: 8, name: "Bloody mary", created_at: "2019-02-18 19:34:06", updated_at: "2019-02-18 19:34:06", photo: "image/upload/v1550518446/whbdnekravftxbmc0frl.jpg">

#   Dose.first
# D, [2019-02-20T13:53:41.916786 #4] DEBUG -- :   Dose Load (1.1ms)  SELECT  "doses".* FROM "doses" ORDER BY "doses"."id" ASC LIMIT $1  [["LIMIT", 1]]
# => #<Dose id: 13, description: "5cl", cocktail_id: 9, ingredient_id: 154, created_at: "2019-02-18 19:42:54", updated_at: "2019-02-18 19:42:54">

#  Review.first
# D, [2019-02-20T14:04:36.092270 #4] DEBUG -- :   Review Load (1.3ms)  SELECT  "reviews".* FROM "reviews" ORDER BY "reviews"."id" ASC LIMIT $1  [["LIMIT", 1]]
# => #<Review id: 12, content: "Not the best :(", rating: 2, cocktail_id: 8...">

puts "Creating Reviews"
puts "----------------"
rev_1 = Review.create!(content: "Not the best :(", rating: 2, cocktail_id: Cocktail.all.sample.id)
rev_2 = Review.create!(content: "Perfect drink", rating: 5, cocktail_id: Cocktail.all.sample.id)
rev_3 = Review.create!(content: "The best in town ", rating: 5, cocktail_id: Cocktail.all.sample.id)
rev_4 = Review.create!(content: "Average", rating: 3, cocktail_id: Cocktail.all.sample.id)
rev_5 = Review.create!(content: "Nice", rating: 2, cocktail_id: Cocktail.all.sample.id)
rev_6 = Review.create!(content: "Very tasty", rating: 4, cocktail_id: Cocktail.all.sample.id)
rev_7 = Review.create!(content: "Just good", rating: 3, cocktail_id: Cocktail.all.sample.id)
rev_8 = Review.create!(content: "Not my taste", rating: 1, cocktail_id: Cocktail.all.sample.id)


# REVIEWS = [
#   {
#     content: "Pefect drink",
#     rating: 4
#   }
# ]

mochito_review = Review.new(content: "Perfect drink", rating: 4)
mochito_review.cocktail = mochito
mochito_review.save

secret_review = Review.new(content: "Funcy drink 🍹", rating: 5)
secret_review.cocktail = secret
secret_review.save

puts "#{Ingredient.count} ingredients created"
puts "#{Cocktail.count} cocktails created"
puts "#{Review.count} reviews created"

puts "*" * 20
puts "Finish!!!"


# {
#   "drinks": [
#     {
#       "strIngredient1": "Light rum"
#     },
#     {
#       "strIngredient1": "Applejack"
