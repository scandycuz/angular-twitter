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
      "billmaher",
      "mollyesque",
      "JohnDingell",
      "davidafrench",
      "elonjames",
      "benpolitico",
      "AlanColmes",
      "MysteryPollster",
      "RasmussenPoll",
      "elonmusk",
      "Schwarzenegger",
      "mviser",
      "BuzzFeedAndrew",
      "EliStokols",
      "amychozick",
      "TheBradMielke",
      "DomenicoNPR",
      "danmericaCNN",
      "EvanMcSan",
      "wpjenna",
      "daveweigel",
      "fixfelicia",
      "pwire",
      "SusanPage",
      "alex_wags",
      "HotlineReid",
      "PElliottAP",
      "thegarance",
      "mikememoli",
      "ErinMcPike",
      "markknoller",
      "dmataconis",
      "ppppolls",
      "LeahNTorres",
      "andersoncooper",
      "maddow",
      "GStephanopoulos",
      "camanpour",
      "mikeallen",
      "chucktodd",
      "brianstelter",
      "BuzzFeedBen",
      "ariannahuff",
      "chrislhayes",
      "AnnCurry",
      "paulkrugman",
      "seanhannity",
      "wolfblitzer",
      "FareedZakaria",
      "megynkelly",
      "TheFix",
      "ggreenwald",
      "JoeNBC",
      "daveweigel",
      "markknoller",
      "mitchellreports",
      "michellemalkin",
      "MHarrisPerry",
      "HowardKurtz",
      "DanaPerino",
      "BretBaier",
      "greta",
      "AHMalcolm",
      "glennbeck",
      "donnabrazile",
      "DavidCornDC",
      "KatrinaNation",
      "nycjim",
      "mtaibbi",
      "mattyglesias",
      "DianeSawyer",
      "donlemon",
      "markos",
      "tomfriedman",
      "anamariecox",
      "ChrisCuomo",
      "TheRevAl",
      "sullydish",
      "billkeller2014",
      "CharlesMBlow",
      "jaketapper",
      "megynkelly",
      "seanhannity",
      "DRUDGE",
      "oreillyfactor",
      "DLoesch",
      "AnnCoulter",
      "edhenry",
      "TuckerCarlson",
      "greggutfeld",
      "MajorCBS",
      "secupp",
      "brithume",
      "EWErickson",
      "Judgenap",
      "AndreaTantaros",
      "stephenfhayes",
      "kimguilfoyle",
      "TeamCavuto",
      "Peggynoonannyc",
      "KirstenPowers",
      "costareports",
      "LarrySabato",
      "RichLowry",
      "ericbolling",
      "MonicaCrowley",
      "JonahNRO",
      "MarkLeibovich",
      "politicalwire",
      "nickconfessore",
      "jbarro",
      "DylanByers",
      "jonkarl",
      "WillieGeist",
      "marcambinder",
      "morningmika",
      "RyanLizza",
      "thegarance",
      "ktumulty",
      "JeffreyGoldberg",
      "rickklein",
      "DLeonhardt",
      "maggieNYT",
      "MarkHalperin",
      "NorahODonnell",
      "samsteinhp",
      "jmartNYT",
      "davidfrum",
      "HowardKurtz",
      "mitchellreports",
      "markknoller",
      "TheFix",
      "daveweigel",
      "Lawrence",
      "joshtpm",
      "blakehounshell",
      "BorowitzReport"
    ]

    prominent_handles = prominent_handles.uniq

    # Find popular tweet and popular response for each handle
    prominent_handles.each do |handle|

      tweets = {}

      # get most recently used tweet for handle
      most_recent_tweet = Tweet.joins(:user).where("users.screen_name = ?", handle).order(created_at: :desc).limit(1)

      # get recent tweets
      # if most recent tweet exists, search only for later tweets
      if most_recent_tweet.empty?
        tweets = @user.search_tweets({
          "q" => "from:#{handle}",
          "count" => 10
        })
        p handle
        p tweets
      else
        most_recent_tweet_id = most_recent_tweet[0][:tweet_id_str].to_i || 0
        tweets = @user.search_tweets({
          "q" => "from:#{handle}",
          "count" => 10,
          "since_id" => most_recent_tweet_id
        })
        p handle
        p tweets
      end

      p tweets

      tweets = tweets['statuses'] if tweets

      if !tweets || tweets.empty?
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

      # skip if no popular responses to handle
      if !response_statuses || response_statuses.empty?
        puts "No popular responses found for #{handle}"
        next
      end

      most_popular_response = response_statuses.select do |status|
        status['in_reply_to_status_id'] == most_popular_tweet_id
      end.max_by do |status|
        status['favourites_count'] && status['retweet_count']
      end

      # skip if no popular replies to initial tweet
      if !most_popular_response
        puts "No popular replies for #{handle}\'s tweet"
        next
      end

      # make sure two Twitter authors aren't listed in the feed consecutively *cough* Trump *cough*
      last_tweet_author = Tweet.joins(:user).order(created_at: :desc).limit(2).last.user[:screen_name]
      second_to_last_tweet_author = Tweet.joins(:user).order(created_at: :desc).limit(4).last.user[:screen_name]
      if handle == last_tweet_author || handle == second_to_last_tweet_author
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
