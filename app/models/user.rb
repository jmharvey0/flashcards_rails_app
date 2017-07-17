class User < ApplicationRecord
  has_many :rounds, dependent: :destroy
  has_secure_password

  validates :username, presence: true
  validates :password, length: {minimum: 6}
end
