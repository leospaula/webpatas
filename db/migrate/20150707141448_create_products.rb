class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.text :technical_information
      t.string :brand
      t.string :reference
      t.string :sku
      t.string :image_1
      t.string :image_2
      t.string :image_3
      t.string :image_4

      t.timestamps null: false
    end
  end
end
