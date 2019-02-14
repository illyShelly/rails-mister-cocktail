class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient

  validates :description, presence: true
  validates :cocktail, :ingredient, presence: true

  validates :cocktail, uniqueness: { scope: :ingredient }
end


# has a description, a cocktail and an ingredient, and [cocktail, ingredient] pairings should be unique.
