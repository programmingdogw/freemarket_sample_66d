class Item < ApplicationRecord
  belongs_to :user
  belongs_to :address
  belongs_to :category
  belongs_to :brand
  has_many :comments
  has_many :images
  has_many :appropriations
  has_many :evaluations
end
