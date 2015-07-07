class Product < ActiveRecord::Base
  has_and_belongs_to_many :sub_categories

  validates :name, :description, :brand, :sku, :image_1, presence: true

  mount_uploader :image_1, ProductImageUploader
  mount_uploader :image_2, ProductImageUploader
  mount_uploader :image_3, ProductImageUploader
  mount_uploader :image_4, ProductImageUploader
end
