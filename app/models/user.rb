class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validate :password, length: { minimum: 3 }
end
