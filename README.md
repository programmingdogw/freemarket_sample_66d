

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|address_id|references|null: false, foreign_key: true|
|nickname|string|null: false|
|lastname|string|null: false|
|firstname|string|null: false|
|lastname_kana|string|null: false|
|firstname-kana|string|null: false|
|email|string|null: false, unique:true|
|password|varchar|null: false, unique:true|
|birthdate|date|null: false|
|telephone_number|string|null: false|
|sales|integer||
|points|integer||


### Association
- has_many: items
- has_many: comments
- has_many: todos
- has_many: news
- has_many: evaluations
- has_many: appropriations
- has_many: credit_cards
- belogs_to : address


## addressesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|lastname|string|null: false|
|firstname|string|null: false|
|lastname_kana|string|null: false|
|firstname-kana|string|null: false|
|postal_code|text|null: false|
|prefecture|text|null: false|
|manicipality|text|null: false|
|street|text|null: false|
|building|text||
|telephone_number|string||


### Association
- has_many: users
- has_many: items

## credit_cardsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|bank|text|null: false|
|number|text|null: false|



### Association
- belongs_to: user


## todosテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|lead_text|text|null: false|
|content_text|text|null: false|



### Association
- belongs_to: user

## newsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|lead_text|text|null: false|
|content_text|text|null: false|


### Association
- belongs_to :user


## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
|comment_content|string|null: false|

### Association
- belongs_to :user
- belongs_to :item

## evaluationsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
|evaluation|integer||

### Association
- belongs_to :user
- belongs_to :item

## appropriationsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
|appropriation|boolean||

### Association
- belongs_to :user
- belongs_to :item

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|brand_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|
|address_id|references|null: false, foreign_key: true|
|name|string|null: false|
|price|integer|null: false|
|condition|string|null: false|
|description|text|null: false|
|size|string|null: false|
|delivery_way|text|null: false|
|delivery_cost|text|null: false|
|delivery_time|text|null: false|
|auction|boolean||
|dealing|boolean||
|sold|boolean||

### Association
- belongs_to :user
- belongs_to :address
- belongs_to :category
- belongs_to :brand
- has_many: comments
- has_many: images
- has_many: appropriations
- has_many: evaluations


## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|image|text|null: false|

### Association
- belongs_to :item

## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|text|null: false|

### Association
- has_many :items

## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|text|null: false|

### Association
- has_many :items
- has_ancestry

