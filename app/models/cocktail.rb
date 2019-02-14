class Cocktail < ApplicationRecord
  # has_many :ingredients, through: doses
  # has_many :doses, dependent: destroy

  validates :name, uniqueness: true, presence: true
  # later reviews
end

# 1. cocktail has many ingredients though doses with volume
# 2. has many doses -> destroyed when deleted cocktail
# 3. deleting cocktails - should del associated doses
# (but not the ingredients as they can be linked to other cocktails).

# 4. uncomment relation when testing first Controller
