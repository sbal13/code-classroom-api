class Cohort < ApplicationRecord
  has_many :user_cohorts
  has_many :users, through: :user_cohorts

  has_many :rooms

  validates :name, uniqueness: true
end
