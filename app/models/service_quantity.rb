class ServiceQuantity < ApplicationRecord
  belongs_to :service
  belongs_to :user
  belongs_to :invoice
end