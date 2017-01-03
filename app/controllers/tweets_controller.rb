require 'twitter_api'

class TweetsController < ApplicationController

  def index
    @user = TwitterOAuth.new("5hVOERlpCYPJEQlwmDxPAdcNZ",
                     "uIu4ZAUkjhTQVUeJGoLfTEHcFzSBghqS4rUvrFgI3UvCWFHbwE",
                     "3278416747-tc3iajgag8G4FPm5pvG0AUPqLT2Zb8Jn7PRxKI8",
                     "JiwEFnYLmReXpazgieHmttL1whjDQEMbTNI4xMh5HJrx0")

    prominent_handles = [
      "realdonaldtrump",
      "PutinRF_Eng",
      "POTUS",
      "JerrySeinfeld",
      "Oprah",
      "KingJames",
      "BillGates",
      "KevinHart4real",
      "CNN",
      "kanyewest",
      "danieltosh",
      "emmawatson",
      "NASA",
      "Google",
      "JimCarrey",
      "NBCNews",
      "Sethrogen",
      "rickygervais",
      "WilliamShatner",
      "jack",
      "LeoDiCaprio",
      "neiltyson",
      "Pontifex"
    ]

    @tweet_pairs = []

    # Find popular tweet and popular response for each handle
    prominent_handles.each do |handle|
      pair = []

      # get recent tweets
      tweets = @user.search_tweets({
        "q" => "from:#{handle}",
        "count" => 10
      })['statuses']

      next if tweets.empty?

      # find most popular tweet
      most_popular = tweets.max_by do |status|
        status['favourites_count'] && status['retweet_count']
      end

      most_popular_id = most_popular['id']

      # find most popular response to tweet
      response_statuses = @user.search_tweets({
        "q" => "to:#{handle}",
        "count" => 100,
        "since_id" => most_popular_id,
        "result_type" => "popular"
      })['statuses']

      most_popular_response = response_statuses.select do |status|
        status['in_reply_to_status_id'] == most_popular_id
      end.max_by do |status|
        status['favourites_count'] && status['retweet_count']
      end

      # add conversation if there is a popular response
      if most_popular_response
        pair << most_popular
        pair << most_popular_response
        @tweet_pairs << pair
      end
    end

    @tweet_pairs
  end

end
