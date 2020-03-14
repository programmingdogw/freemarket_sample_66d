class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      #Add
      t.biginit :user,         null: false, foreign_key: true
      t.biginit :item,         null: false, foreign_key: true
      t.string :comment_content,  null: false

      t.timestamps
    end
  end
end
