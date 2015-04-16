json.array!(@weathers) do |weather|
  json.extract! weather, :id, :city, :country
  json.url weather_url(weather, format: :json)
end
