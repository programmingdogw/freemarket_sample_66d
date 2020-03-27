class CreateDealConditions < ActiveRecord::Migration[5.2]
  def change
    create_table :deal_conditions do |t|
      t.bigint :item_id,  null: false, foreign_key: true
      t.boolean :auction
      t.boolean :dealing
      t.boolean :sold
      t.timestamps
    end
  end
end
