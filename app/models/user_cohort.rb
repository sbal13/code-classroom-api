class UserCohort < ApplicationRecord
  belongs_to :user
  belongs_to :cohort

  validates_uniqueness_of :user_id, :scope => :cohort_id
end
