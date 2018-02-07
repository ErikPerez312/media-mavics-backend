class User < ApplicationRecord
  has_many :campaigns
  validates :name, :phone_number, :business_name, presence: true
  validates :email, presence: true, uniqueness: true
end
