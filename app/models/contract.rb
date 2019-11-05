class Contract < ApplicationRecord
  belongs_to :user
  belongs_to :unit
  belongs_to :room
end
