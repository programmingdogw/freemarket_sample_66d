class Address < ApplicationRecord
  has_many :users
  has_many :items
end
