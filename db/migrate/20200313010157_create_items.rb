class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      #Add
      t.bigint :user_id,      null: false, foreign_key: true
      t.bigint :category_id,  null: false, foreign_key: true
      # t.bigint :address_id,   null: false, foreign_key: true 必要か微妙。とりあえずコメントアウトしてる。多分削除する予定。
      t.string :name,          null: false
      t.integer :price,        null: false
      t.string :condition,     null: false
      t.text :description,     null: false
      t.string :size,          null: false
      t.text :delivery_way,    null: false
      t.text :delivery_cost,   null: false
      t.integer :delivery_from,   null:false
      t.text :delivery_time,   null: false
      t.text :brand
      t.boolean :auction
      t.boolean :dealing
      t.boolean :sold

      t.text :parentcategory   
      t.integer :childcategory 


      t.timestamps
    end
  end
end
