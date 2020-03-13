class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      #Add
      t.references :user,         null: false, foreign_key: true
      t.references :item,         null: false, foreign_key: true
      t.string :comment_content,  null: false

      t.timestamps
    end
  end
end
