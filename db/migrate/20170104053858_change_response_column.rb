class ChangeResponseColumn < ActiveRecord::Migration
  def change
    remove_column :tweets, :response_id
    add_column :tweets, :initial_tweet_id, :integer, index: true
  end
end
