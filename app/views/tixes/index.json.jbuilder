json.array!(@tixes) do |tix|
  json.extract! tix, :eventname, :eventtype, :price
  json.url tix_url(tix, format: :json)
end
