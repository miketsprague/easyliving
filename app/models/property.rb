class Property < ActiveRecord::Base
  belongs_to :property_manager
  acts_as_gmappable


  def gmaps4rails_address
    address
  end
end
