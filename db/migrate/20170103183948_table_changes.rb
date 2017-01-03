class TableChanges < ActiveRecord::Migration
  def change
    change_column :tweets, :tweet_id, :integer
    add_column :tweets, :tweet_id_str, :string
    add_column :users, :user_id_str, :string
    add_column :users, :screen_name, :string, index: true
  end
end
