class User < ApplicationRecord
  has_many :submissions
  
  has_secure_password
end
