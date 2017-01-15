require 'twitter_api'
require 'twitter_request'

class TweetsController < ApplicationController

  def index
    # get initial tweets
    tweets = Tweet.includes(:response, :user)
    .where('tweets.initial_tweet_id IS NULL')
    .paginate(page: params[:page], per_page: 4)
    .order(created_at: :desc)

    # pair initial tweets with their response
    @tweet_pairs = []
    tweets.each do |tweet|
      @tweet_pairs << [tweet, tweet.response]
    end

    render :index
  end

end
