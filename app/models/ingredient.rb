class Ingredient < ApplicationRecord
  has_many :doses
  has_many :ingredients, through: :doses

end


# 1. ingredient has many doses -> differ volumes mint -> 3pieces
# 2. has many cocktails -> 1 ingredient in many drinks through dose
