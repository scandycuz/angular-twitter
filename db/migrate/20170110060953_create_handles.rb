class CreateHandles < ActiveRecord::Migration
  def change
    create_table :handles do |t|
      t.string :screen_name, null: false, index: true, unique: true
      t.integer :group, null: false, index: true
      t.timestamps null: false
    end
  end
end
