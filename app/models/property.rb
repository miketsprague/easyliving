class Property < ActiveRecord::Base
  require 'csv'
  belongs_to :landlord
  acts_as_gmappable
 
  def self.load_from_csv(file)
    CSV.foreach(file, headers: true) do |row|
 
      pm_hash = row.to_hash 
      pm = Property.where(id: pm_hash["id"])
 
      if pm.count == 1
        pm.first.update_attributes(pm_hash)
      else
        Property.create!(pm_hash)
      end 
    end 
  end 


  def gmaps4rails_address
    address
  end
end
