#DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|user_name|string|null: false, unique:true, index: true|
|email|string||
|password|varchar||
|adress|text||
|birthdate|date||
|credit_card_bank|string||
|credit_card_number|string||
|telephone_number|string||
|sales|integer||
|points|integer||


### Association
- has_many: items
- has_many: comments
- has_many: todos
- has_many: news
- has_many: evaluations
- has_many: appropriations
- belogns_to: prefectures



## todosテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|reference|null: false, foreign_key: true|
|todo_lead|text||
|todo_content|text||



### Association
- belongs_to: user

## newsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|lead_text|text||
|news_content|text||


### Association
- belongs_to :user

## prefecturesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
|prefecture_name|string||

### Association
- has_many :users
- has_many :items

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
|comment_content|string||

### Association
- belongs_to :user
- belongs_to :item

## evaluationsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
|evaluation|text||

### Association
- belongs_to :user
- belongs_to :item

## appropriationsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
|appropriation|text||

### Association
- belongs_to :user
- belongs_to :item

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_name|string||
|item_price|integer||
|item_condition|string||
|item_description|text||
|item_size|string||
|delivery_way|text||
|delivery_cost|text||
|auction|boolean||
|dealing|boolean||
|sold|boolean||

### Association
- belongs_to :user
- belongs_to :prefectures
- belongs_to :bigcategorys
- belongs_to :brands
- has_many: comments
- has_many: images
- has_many: appropriations
- has_many: evaluations


## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|image|text||

### Association
- belongs_to :item

## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|brand_name|text||

### Association
- has_many :items



今途中
参考用
### Association
- has_many: messages
- has_many: users_groups
- has_many: users, through: :users_groups

||||