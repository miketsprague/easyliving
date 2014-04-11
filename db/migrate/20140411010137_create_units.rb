class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.string :number
      t.string :type
      t.string :rent
      t.date :date_available
      t.string :description
      t.string :security_deposit
      t.references :property, index: true

      t.timestamps
    end
  end
end
