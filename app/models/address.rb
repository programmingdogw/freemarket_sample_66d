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

  # VALID_PHONE_REGEX = /\A[0-9]{10,11}\z/
  # validates :telephone_number, allow_blank: true, format: { with: VALID_PHONE_REGEX }
  
  validates :prefecture, presence: true
  validates :municipality, presence: true
  validates :street, presence: true

end
