json.array!(@posts) do |post|
  json.extract! post, :id, :title, :autor, :text
  json.url post_url(post, format: :json)
end
