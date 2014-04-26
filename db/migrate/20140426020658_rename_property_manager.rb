class RenamePropertyManager < ActiveRecord::Migration
  def change
    rename_table :property_managers, :landlords
    rename_column :properties, :property_manager_id, :landlord_id
  end
end
