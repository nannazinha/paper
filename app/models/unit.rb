class Unit < ApplicationRecord
  belongs_to :admin
  belongs_to :company
  has_many :rooms
end
