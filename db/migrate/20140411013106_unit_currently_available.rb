class UnitCurrentlyAvailable < ActiveRecord::Migration
  def change
    add_column :units, :available, :boolean, default: true
  end
end
