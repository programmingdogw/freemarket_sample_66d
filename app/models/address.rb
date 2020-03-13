class Address < ApplicationRecord

  has_many :users
  has_many :items
  
  VALID_ZENKAKU_REGEX = /\A[^ -~｡-ﾟ]+\z/
  validates :lastname, presence: true, format: { with: VALID_ZENKAKU_REGEX }
  validates :firstname, presence: true, format: { with: VALID_ZENKAKU_REGEX }

  VALID_FURIGANA_REGEX = /\A[ぁ-んァ-ヶー－]+\z/
  validates :lastname_kana, presence: true, format: { with: VALID_FURIGANA_REGEX }
  validates :firstname_kana, presence: true, format: { with: VALID_FURIGANA_REGEX }


  validates :postal_code, presence: true
  validates :prefecture, presence: true
  validates :manicipality, presence: true
  validates :street, presence: true

end
