class Room < ApplicationRecord
  has_many :submissions
  belongs_to :cohort
end
