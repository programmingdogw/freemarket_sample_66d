class Item < ApplicationRecord

  belongs_to :user, optional:true
  belongs_to :address, optional:true
  belongs_to :category, optional:true
  has_many :comments
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true
  has_many :appropriations
  has_many :evaluations


  # validates :name, presence: true
  # validates :price, presence: true
  # validates :condition, presence: true
  # validates :description, presence: true
  # validates :size, presence: true
  # #validates :delivery_way, presence: true
  # validates :delivary_cost, presence: true
  # validates :delivary_from, presence: true
  # validates :delivary_time, presence: true

end
