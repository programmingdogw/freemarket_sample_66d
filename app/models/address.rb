class Address < ApplicationRecord

  has_many :users
  has_many :items
  

  validates :lastname, presence: true
  validates :firstname, presence: true
  validates :lastname_kana, presence: true
  validates :firstname_kana, presence: true
  validates :postal_code, presence: true
  validates :prefecture, presence: true
  validates :manicipality, presence: true
  validates :street, presence: true

end
