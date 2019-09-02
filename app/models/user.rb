class User < ApplicationRecord
  has_many :submissions
  has_many :user_cohorts
  has_many :cohorts, through: :user_cohorts

  validates :username, presence: true, uniqueness: true
  
  has_secure_password
end
