class RemoveIntColumns < ActiveRecord::Migration
  def change
    remove_column :users, :twitter_id
    remove_column :tweets, :tweet_id
  end
end
