class CreateStoreAccesses < ActiveRecord::Migration
  def change
    create_table :store_accesses do |t|
      t.inet :ip
      t.references :store, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
