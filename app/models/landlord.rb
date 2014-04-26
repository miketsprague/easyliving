class Landlord < ActiveRecord::Base
#  require 'CSV'
 
#  def self.import(file)
#    CSV.foreach(file, headers: true) do |row|
# 
#      pm_hash = row.to_hash 
#      pm = Landlord.where(id: pm_hash["id"])
# 
#      if pm.count == 1
#        pm.first.update_attributes(pm_hash)
#      else
#        Landlord.create!(pm_hash)
#      end # end if !product.nil?
#    end # end CSV.foreach
#  end # end self.import(file)
end
