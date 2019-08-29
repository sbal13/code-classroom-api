class RoomSerializer < ActiveModel::Serializer
  attributes :id, :name, :language, :code
  has_many :submissions
end
