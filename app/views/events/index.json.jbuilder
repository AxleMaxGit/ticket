json.array!(@events) do |event|
  json.extract! event, :eventname, :eventtype, :location, :price
  json.url event_url(event, format: :json)
end
