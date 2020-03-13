class CreateAppropriations < ActiveRecord::Migration[5.2]
  def change
    create_table :appropriations do |t|

      t.timestamps
    end
  end
end
