class AddResponseColumnToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :response_id, :integer, index: true
  end
end
