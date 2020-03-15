class Address < ApplicationRecord

  belongs_to :user, optional:true
  has_many :items
  
  VALID_ZENKAKU_REGEX = /\A[^ -~｡-ﾟ]+\z/
  validates :lastname, presence: true, format: { with: VALID_ZENKAKU_REGEX }
  validates :firstname, presence: true, format: { with: VALID_ZENKAKU_REGEX }

  VALID_FURIGANA_REGEX = /\A[ぁ-んァ-ヶー－]+\z/
  validates :lastname_kana, presence: true, format: { with: VALID_FURIGANA_REGEX }
  validates :firstname_kana, presence: true, format: { with: VALID_FURIGANA_REGEX }

  VALID_POSTAL_REGEX = /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}\z/
  validates :postal_code, presence: true, format: { with: VALID_POSTAL_REGEX }
  validates :prefecture, presence: true
  validates :manicipality, presence: true
  validates :street, presence: true

end
