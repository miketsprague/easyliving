class CreatePropertyManagers < ActiveRecord::Migration
  def change
    create_table :property_managers do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
