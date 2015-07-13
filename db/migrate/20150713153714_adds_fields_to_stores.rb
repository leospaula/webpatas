class AddsFieldsToStores < ActiveRecord::Migration
  def change
    add_column :stores, :contact_name, :string
    add_column :stores, :facebook, :string
  end
end
