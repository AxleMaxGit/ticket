json.array!(@customers) do |customer|
  json.extract! customer, :name, :postcode
  json.url customer_url(customer, format: :json)
end
