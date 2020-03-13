class CreateAppropriations < ActiveRecord::Migration[5.2]
  def change
    create_table :appropriations do |t|
      #Add
      t.references :user,     null: false, foreign_key: true
      t.references :item,     null: false, foreign_key: true
      t.boolean :appropriation

      t.timestamps
    end
  end
end
