class SubmissionSerializer < ActiveModel::Serializer
  attributes :id, :code, :user
  belongs_to :room
  belongs_to :user


end
