class AddContactTelephoneToStores < ActiveRecord::Migration
  def change
    add_column :stores, :contact_telephone, :string
  end
end
