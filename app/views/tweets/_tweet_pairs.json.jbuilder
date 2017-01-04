json.array! pair do |pair|
  json.extract! pair, "tweet_id_str", "text"
  json.partial! 'tweets/user', user: pair.user
end
