class CreateProductAccesses < ActiveRecord::Migration
  def change
    create_table :product_accesses do |t|
      t.inet :ip
      t.float :latitude
      t.float :longitude
      t.string :address
      t.references :product, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
