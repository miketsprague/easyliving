class DropTableUnits < ActiveRecord::Migration
  def change
    drop_table :units
  end
end
