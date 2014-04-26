require 'csv'

is_header = true
name_index = 0
desc_index = 0 
number_index = 0
email_index = 0
address_index = 0

CSV.foreach("landlords.csv") do |row|
  if is_header
    row.each_with_index do |cell, index|
      next if cell.nil?
      if cell.casecmp("name").zero?
        name_index = index
      elsif cell.casecmp("description").zero?
        desc_index = index
      elsif cell.casecmp("number").zero?
        number_index = index
      elsif cell.casecmp("email").zero?
        email_index = index
      elsif cell.casecmp("address").zero?
        address_index = index  
      end
    end
    is_header = false
    next
  end

  landlord = PropertyManager.create( :name => row[name_index], :description => row[desc_index], :phone_number => row[number_index], :email => row[email_index], :address => row[address_index] );
  puts landlord
end
