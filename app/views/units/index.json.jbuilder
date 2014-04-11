json.array!(@units) do |unit|
  json.extract! unit, :number, :type, :rent, :date_available, :description, :security_deposit, :property_id
  json.url unit_url(unit, format: :json)
end