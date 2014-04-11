class RenameTypeFieldOnPropertyAndUnit < ActiveRecord::Migration
  def change
    rename_column :properties, :type, :property_type
    rename_column :units, :type, :unit_type
  end
end
