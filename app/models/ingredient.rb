class Ingredient < ApplicationRecord
  # has_many :doses
  # has_many :ingredients, through: :doses

  validates :name, uniqueness: true, presence: true
end


# 1. ingredient has many doses -> differ volumes mint -> 3pieces
# 2. has many cocktails -> 1 ingredient in many drinks through dose
# 3. You can't delete an ingredient if it used by at least one cocktail.
