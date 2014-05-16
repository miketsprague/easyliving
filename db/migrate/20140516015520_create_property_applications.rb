class CreatePropertyApplications < ActiveRecord::Migration
  def change
    create_table :property_applications do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.date :start_date
      t.integer :number_of_cotenants
      t.boolean :attends_a_school
      t.string :school
      t.date :planned_graduation_date
      t.string :phone_number
      t.integer :property_id

      t.timestamps
    end
  end
end
