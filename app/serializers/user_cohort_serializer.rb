class UserCohortSerializer < ActiveModel::Serializer
  attributes :id, :cohort_belongs_to
  has_one :user
end
