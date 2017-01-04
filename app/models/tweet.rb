class Tweet < ActiveRecord::Base

  belongs_to :user
  has_one :response, :class_name => "Tweet", :foreign_key => "initial_tweet_id"

end
