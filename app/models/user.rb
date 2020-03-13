class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :comments
  has_many :todos
  has_many :news
  has_many :evaluations
  has_many :appropriations
  has_many :credit_cards
  belongs_to :address



# - パスワードは確認用を含めて2回入力する


# ## 主な使用技術
# - devise

# ## 注意点
# - 必ずブランチを切って開発を進めること
# - バリデーション及びテストコードを書くこと
# - もし、ウィザード形式での新規登録を実装する場合でも、ウィザードを実装する前に、まずはdeviseのデフォルトでのログインができるかどうか試すと良い

# ## 参考カリキュラム
# - ウィザード形式の実装をする場合は、以下を参考にする
#  - [参考カリキュラム](https://master.tech-camp.in/curriculums/3994)


  validates :password, presence: true, uniqueness: true, length: { minimum: 7 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  
  validates :nickname, presence: true

  VALID_ZENKAKU_REGEX = /\A[^ -~｡-ﾟ]+\z/
  validates :lastname, presence: true, format: { with: VALID_ZENKAKU_REGEX }
  validates :firstname, presence: true, format: { with: VALID_ZENKAKU_REGEX }

  VALID_FURIGANA_REGEX = /\A[ぁ-んァ-ヶー－]+\z/
  validates :lastname_kana, presence: true, format: { with: VALID_FURIGANA_REGEX }
  validates :firstname_kana, presence: true, format: { with: VALID_FURIGANA_REGEX }

  validates :birthdate, presence: true
  validates :telephone_number, presence: true

  
end
