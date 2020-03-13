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
# - ニックネームが必須
# - メールアドレスは一意である
# - メールアドレスは@とドメインを含む必要がある
# - パスワードが必須
# - パスワードは7文字以上
# - パスワードは確認用を含めて2回入力する
# - 本人確認情報
# - ユーザー本名が、名字と名前でそれぞれ必須
# - ユーザー本名は全角で入力させる
# - ユーザー本名のふりがなが、名字と名前でそれぞれ必須
# - ユーザー本名のふりがなは全角で入力させる
# - 生年月日が必須
# - 商品送付先住所情報
# - 送付先氏名が、名字と名前でそれぞれ必須
# - 送付先氏名のふりがなが、名字と名前でそれぞれ必須
# - 郵便番号が必須
# - 都道府県が必須
# - 市区町村が必須
# - 番地が必須
# - マンション名やビル名、そしてその部屋番号は任意
# - お届け先の電話番号は任意
# ## 主な使用技術
# - devise

# ## 注意点
# - 必ずブランチを切って開発を進めること
# - バリデーション及びテストコードを書くこと
# - もし、ウィザード形式での新規登録を実装する場合でも、ウィザードを実装する前に、まずはdeviseのデフォルトでのログインができるかどうか試すと良い

# ## 参考カリキュラム
# - ウィザード形式の実装をする場合は、以下を参考にする
#  - [参考カリキュラム](https://master.tech-camp.in/curriculums/3994)




  validates :email, presence: true, uniqueness: true


end
