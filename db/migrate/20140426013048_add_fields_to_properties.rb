class AddFieldsToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :size_type, :string
    add_column :properties, :rent, :string
    add_column :properties, :security_deposit, :string
    add_column :properties, :date_available, :date
    add_column :properties, :image_urls, :string, array: true
  end
end
