json.array!(@bids) do |bid|
  json.extract! bid, :price, :bidder, :event_id
  json.url bid_url(bid, format: :json)
end
