class Round < ApplicationRecord
  belongs_to :user_id
  belongs_to :deck_id
end
