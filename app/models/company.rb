class Company < ApplicationRecord
  has_many :admins
  has_many :units
end
