class Cocktail < ApplicationRecord
  has_many :ingredients, through: doses
  has_many :doses, dependent: destroy

  # later reviews
end

# 1. cocktail has many ingredients though doses with volume
# 2. has many doses -> destroyed when deleted cocktail
