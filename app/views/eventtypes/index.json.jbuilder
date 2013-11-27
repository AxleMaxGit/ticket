json.array!(@eventtypes) do |eventtype|
  json.extract! eventtype, :category
  json.url eventtype_url(eventtype, format: :json)
end
