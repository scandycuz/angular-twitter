class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :tweet_id, null: false, index: true, unique: true
      t.string :text, null: false
      t.integer :user_id, null: false, index: true
      t.timestamps null: false
    end
  end
end
