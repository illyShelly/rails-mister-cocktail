class Review < ApplicationRecord
  belongs_to :cocktail
  validates :content, presence: true
  validates :rating, inclusion: { in: 0..5 }
end


# rails g  model Review content:string rating:integer cocktail:references

# 1. Cocktail has many Reviews, Review belongs to 1 cocktail
# when cocktail deleted => reviews as well
# 2. routes => resourse under cocktail - just create
# 3. controller & folder with form
