@tweet_pairs.each do |pair|
  json.partial! 'tweets/tweet_pairs', pair: pair
end
