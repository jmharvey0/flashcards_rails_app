class Deck < ApplicationRecord
  has_many :cards, dependent: :destroy
  # Should rounds stay if the the Deck is deleted
  has_many :rounds
end
