class CreateBrands < ActiveRecord::Migration[5.2]
  def change
    create_table :brands do |t|
      #Add
      t.text :name,  null: false

      t.timestamps
    end
  end
end
