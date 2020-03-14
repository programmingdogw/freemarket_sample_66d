class CreateEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluations do |t|
      #Add
      t.bigint :user,     null: false, foreign_key: true
      t.bigint :item,     null: false, foreign_key: true
      t.integer :evaluation
 
      t.timestamps
    end
  end
end
