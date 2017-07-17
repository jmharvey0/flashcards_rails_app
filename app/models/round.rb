class Round < ApplicationRecord
  belongs_to :user
  belongs_to :deck

  validates :user_id, :deck_id, presence: true
end
