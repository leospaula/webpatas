class RemovesImage4FromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :image_4
  end
end
