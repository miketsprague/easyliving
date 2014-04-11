json.array!(@property_managers) do |property_manager|
  json.extract! property_manager, :name, :description
  json.url property_manager_url(property_manager, format: :json)
end