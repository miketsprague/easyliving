class AddContactFieldsToPropertyManagers < ActiveRecord::Migration
  def change
    add_column :property_managers, :email, :string
    add_column :property_managers, :phone_number, :string
    add_column :property_managers, :address, :string
  end
end
