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


#   ## ユーザー登録時のビジネスルール（求められる仕様）
# - ユーザー情報
# - メールアドレスは@とドメインを含む必要がある
# - パスワードは7文字以上
# - パスワードは確認用を含めて2回入力する
# - 本人確認情報
# - ユーザー本名は全角で入力させる
# - ユーザー本名のふりがなは全角で入力させる

# ## 主な使用技術
# - devise

# ## 注意点
# - 必ずブランチを切って開発を進めること
# - バリデーション及びテストコードを書くこと
# - もし、ウィザード形式での新規登録を実装する場合でも、ウィザードを実装する前に、まずはdeviseのデフォルトでのログインができるかどうか試すと良い

# ## 参考カリキュラム
# - ウィザード形式の実装をする場合は、以下を参考にする
#  - [参考カリキュラム](https://master.tech-camp.in/curriculums/3994)



  validates :password, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :nickname, presence: true
  validates :lastname, presence: true
  validates :firstname, presence: true
  validates :lastname_kana, presence: true
  validates :firstname_kana, presence: true
  validates :birthdate, presence: true
  validates :telephone_number, presence: true


end
