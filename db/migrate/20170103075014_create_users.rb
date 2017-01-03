class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :twitter_id, null: false, index: true, unique: true
      t.string :name, index: true
      t.string :profile_image_url
      t.text :description
      t.string :location
      t.timestamps null: false
    end
  end
end
