json.user do
  json.extract! user, "id_str", "name", "screen_name", "profile_image_url", "description", "location"
end
