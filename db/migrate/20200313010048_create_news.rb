class CreateNews < ActiveRecord::Migration[5.2]
  def change
    create_table :news do |t|
      #Add
      t.references :user,    null: false, foreign_key: true
      t.text :lead_text,     null: false
      t.text :content_text,  null: false

      t.timestamps
    end
  end
end
