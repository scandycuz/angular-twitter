json.user do
  json.extract! user, "user_id_str", "name", "screen_name", "profile_image_url", "description", "location"
end
