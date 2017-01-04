require 'twitter_api'
require 'twitter_request'

class TweetsController < ApplicationController

  def index
    tweets = Tweet.includes(:response, :user).where('tweets.initial_tweet_id IS NULL')
    @tweet_pairs = []
    tweets.each do |tweet|
      @tweet_pairs << [tweet, tweet.response]
    end
    render :index
  end

end
