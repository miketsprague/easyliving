class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :name
      t.string :address
      t.string :type
      t.string :description
      t.references :property_manager, index: true

      t.timestamps
    end
  end
end
