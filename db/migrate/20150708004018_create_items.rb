class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :product, index: true, foreign_key: true
      t.references :store, index: true, foreign_key: true
      t.boolean :available
      t.decimal :price

      t.timestamps null: false
    end
  end
end
