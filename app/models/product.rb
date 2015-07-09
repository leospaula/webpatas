class Product < ActiveRecord::Base
  has_many :items
  has_and_belongs_to_many :sub_categories

  validates :name, :description, :brand, :sku, :image_1, presence: true

  scope :having_items, -> { where(id: Item.uniq.pluck(:product_id)) }
  scope :with_name, -> (name) { where(%q{"products"."name" ~* ?}, name) }

  (1..4).each do |i|
    mount_uploader :"image_#{i}", ProductImageUploader
  end
end
