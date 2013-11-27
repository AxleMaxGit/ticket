json.array!(@locations) do |location|
  json.extract! location, :place
  json.url location_url(location, format: :json)
end
