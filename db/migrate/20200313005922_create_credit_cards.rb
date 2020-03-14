class CreateCreditCards < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_cards do |t|
      #Add
      t.biginit :user,  null: false, foreign_key: true
      t.text :bank,        null: false
      t.text :number,      null: false

      t.timestamps
    end
  end
end
