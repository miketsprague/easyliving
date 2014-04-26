json.array!(@properties) do |property|
  json.extract! property, :name, :address, :type, :description, :landlord_id
  json.url property_url(property, format: :json)
end
