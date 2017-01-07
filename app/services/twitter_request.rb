require 'twitter_api'

class TwitterRequest

  def initialize
    @user = TwitterOAuth.new("5hVOERlpCYPJEQlwmDxPAdcNZ",
   "uIu4ZAUkjhTQVUeJGoLfTEHcFzSBghqS4rUvrFgI3UvCWFHbwE",
   "3278416747-tc3iajgag8G4FPm5pvG0AUPqLT2Zb8Jn7PRxKI8",
   "JiwEFnYLmReXpazgieHmttL1whjDQEMbTNI4xMh5HJrx0")

   @first_user
   @second_user
   @first_tweet
   @second_tweet
  end

  def update_tweets
    prominent_handles = [
      "realDonaldTrump",
      "RBReich",
      "PutinRF_Eng",
      "ConanOBrien",
      "POTUS",
      "JerrySeinfeld",
      "Oprah",
      "KingJames",
      "BillGates",
      "KevinHart4real",
      "Trevornoah",
      "CNN",
      "StephenAtHome",
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
      "Pontifex",
      "elizabethforma",
      "danaperino",
      "NateSilver538",
      "jaketapper",
      "buzzfeedben",
      "billmaher",
      "mollyesque",
      "JohnDingell",
      "davidafrench",
      "elonjames",
      "benpolitico",
      "AlanColmes",
      "MysteryPollster",
      "RasmussenPoll",
      "elonmusk"
    ]

    # Find popular tweet and popular response for each handle
    prominent_handles.each do |handle|

      # get most recently used tweet for handle
      most_recent_tweet = Tweet.joins(:user).where("users.screen_name = ?", handle).order(created_at: :desc).limit(1)

      # get recent tweets
      # if most recent tweet exists, search only for later tweets
      if most_recent_tweet.empty?
        tweets = @user.search_tweets({
          "q" => "from:#{handle}",
          "count" => 10
        })
      else
        most_recent_tweet_id = most_recent_tweet[0][:tweet_id_str].to_i
        tweets = @user.search_tweets({
          "q" => "from:#{handle}",
          "count" => 10,
          "since_id" => most_recent_tweet_id
        })
      end

      if tweets && !tweets['statuses'].empty?
        tweets = tweets['statuses']
      else
        puts "No new tweets found for #{handle}"
        next
      end

      # find most popular tweet
      most_popular_tweet = tweets.max_by do |status|
        status['favourites_count'] && status['retweet_count']
      end

      # save twitter user in database if doesn't exist
      user = most_popular_tweet['user']
      user_id_str = user['id_str']
      user_name = user['name']
      user_screen_name = user['screen_name']
      user_location = user['location']
      user_description = user['description']
      user_profile_image_url = user['profile_image_url']
      user_params = {
        user_id_str: user_id_str,
        name: user_name,
        screen_name: user_screen_name,
        profile_image_url: user_profile_image_url,
        description: user_description,
        location: user_location
      }

      existing_user = User.find_by_screen_name(user_screen_name)
      if existing_user
        @first_user = existing_user
      else
        @first_user = User.create(user_params)
      end

      # save first tweet params
      tweet_user_id = @first_user[:id]
      tweet_id_str = most_popular_tweet['id_str']
      tweet_text = most_popular_tweet['text']
      tweet_params = {
        user_id: tweet_user_id,
        tweet_id_str: tweet_id_str,
        text: tweet_text
      }

      # find most popular response to tweet
      most_popular_tweet_id = most_popular_tweet['id']
      response_statuses = @user.search_tweets({
        "q" => "to:#{handle}",
        "count" => 100,
        "since_id" => most_popular_tweet_id,
        "result_type" => "popular"
      })
      response_statuses = response_statuses['statuses'] if response_statuses

      most_popular_response = response_statuses.select do |status|
        status['in_reply_to_status_id'] == most_popular_tweet_id
      end.max_by do |status|
        status['favourites_count'] && status['retweet_count']
      end

      if !most_popular_response
        puts "No popular responses for #{handle}'s tweet'"
        next
      end

      # make sure two Twitter authors aren't listed in the feed consecutively *cough* Trump *cough*
      last_tweet_author = Tweet.joins(:user).order(created_at: :desc).limit(2).last.user[:screen_name]
      if handle == last_tweet_author
        puts "Skipping #{handle}'s conversation to avoid consecutive authors in feed"
        next
      end

      # initial tweet and popular response found,
      # add initial tweet to database
      puts "Conversation found! Logging to database"
      @first_tweet = Tweet.create(tweet_params)

      # add response's user to database if doesn't exist yet
      user = most_popular_response['user']
      user_id_str = user['id_str']
      user_name = user['name']
      user_screen_name = user['screen_name']
      user_location = user['location']
      user_description = user['description']
      user_profile_image_url = user['profile_image_url']
      user_params = {
        user_id_str: user_id_str,
        name: user_name,
        screen_name: user_screen_name,
        profile_image_url: user_profile_image_url,
        description: user_description,
        location: user_location
      }

      existing_user = User.find_by_screen_name(user_screen_name)
      if existing_user
        @second_user = existing_user
      else
        @second_user = User.create(user_params)
      end

      # add response tweet to database
      tweet_user_id = @second_user[:id]
      tweet_id_str = most_popular_response['id_str']
      tweet_text = most_popular_response['text']
      initial_tweet_id = @first_tweet[:id]
      tweet_params = {
        user_id: tweet_user_id,
        tweet_id_str: tweet_id_str,
        text: tweet_text,
        initial_tweet_id: initial_tweet_id
      }

      @second_tweet = Tweet.create(tweet_params)
    end

  end

end
