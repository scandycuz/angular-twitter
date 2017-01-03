json.array! pair do |pair|
  json.extract! pair, "id_str", "text"
  json.partial! 'tweets/user', user: pair["user"]
end
