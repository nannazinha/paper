class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable,
         :rememberable, :validatable
  enum gender: [:female, :male, :other]
  belongs_to :admin
  has_many :invoices
end
