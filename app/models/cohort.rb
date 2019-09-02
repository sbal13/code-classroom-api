class Cohort < ApplicationRecord
  has_many :user_cohorts
  has_many :cohorts, through: :user_cohorts

  has_many :rooms
end
