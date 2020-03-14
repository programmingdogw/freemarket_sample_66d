class CreateAppropriations < ActiveRecord::Migration[5.2]
  def change
    create_table :appropriations do |t|
      #Add
      t.biginit :user,     null: false, foreign_key: true
      t.biginit :item,     null: false, foreign_key: true
      t.boolean :appropriation

      t.timestamps
    end
  end
end
