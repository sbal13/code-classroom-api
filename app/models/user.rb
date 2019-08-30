class User < ApplicationRecord
  has_many :submissions

  validates :username, presence: true
  
  # has_secure_password
end
