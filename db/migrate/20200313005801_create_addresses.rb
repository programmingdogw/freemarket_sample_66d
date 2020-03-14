class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      #Add
   
      t.string :destination_lastname,        null: false
      t.string :destination_firstname,       null: false
      t.string :destination_lastname_kana,   null: false
      t.string :destination_firstname_kana,  null: false
      t.text :postal_code,        null: false
      t.text :prefecture,        null: false
      t.text :municipality,      null: false
      t.text :street,            null: false
      t.text :building
      t.string :destination_telephone_number

      t.timestamps
    end
  end
end

