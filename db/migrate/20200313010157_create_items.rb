class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      #Add
      t.bigint :user,      null: false, foreign_key: true
      t.bigint :brand,     null: false, foreign_key: true
      t.bigint :category,  null: false, foreign_key: true
      t.bigint :address,   null: false, foreign_key: true
      t.string :name,          null: false
      t.integer :price,        null: false
      t.string :condition,     null: false
      t.text :description,     null: false
      t.string :size,          null: false
      t.text :delivery_way,    null: false
      t.text :delivery_cost,   null: false
      t.text :delivery_time,   null: false
      t.boolean :auction
      t.boolean :dealing
      t.boolean :sold

      t.timestamps
    end
  end
end
