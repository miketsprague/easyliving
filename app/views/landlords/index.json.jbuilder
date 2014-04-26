json.array!(@landlords) do |landlord|
  json.extract! landlord, :name, :description
  json.url landlord_url(landlord, format: :json)
end
