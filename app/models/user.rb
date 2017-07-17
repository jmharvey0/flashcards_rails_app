class User < ApplicationRecord
  has_many :rounds
  has_secure_password

  vaildates :password, length: {minimum: 6}
end
