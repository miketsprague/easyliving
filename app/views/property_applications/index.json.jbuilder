json.array!(@property_applications) do |property_application|
  json.extract! property_application, :first_name, :last_name, :email, :start_date, :number_of_cotenants, :attends_a_school, :school, :planned_graduation_date, :phone_number, :property_id
  json.url property_application_url(property_application, format: :json)
end