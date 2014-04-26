class Property < ActiveRecord::Base
  belongs_to :landlord
  acts_as_gmappable


  def gmaps4rails_address
    address
  end
end
