class MakePropertyMappable < ActiveRecord::Migration
  def change
    add_column :properties, :latitude, :float
    add_column :properties, :longitude, :float
    add_column :properties, :gmaps, :boolean


  end
end
