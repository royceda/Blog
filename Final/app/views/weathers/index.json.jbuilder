json.array!(@weathers) do |weather|
  json.extract! weather, :id, :woeid
  json.url weather_url(weather, format: :json)
end
