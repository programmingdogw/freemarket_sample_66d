class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      #Add
      t.references :item,  null: false, foreign_key: true
      t.text :image,       null: false
      
      t.timestamps
    end
  end
end

