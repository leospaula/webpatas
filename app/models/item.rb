class Item < ActiveRecord::Base
  belongs_to :product
  belongs_to :store

  validates :price, :store, presence: true

  delegate :name, :description, :technical_information, :brand, :reference,
    :sku, :image_1, :image_2, :image_3, :image_4, :image_1?, :image_2?,
    :image_3?, :image_4?, :sub_categories, to: :product

  scope :with_name, -> (name) { where(product: Product.with_name(name)) }
  scope :scoped_near, -> (latitude, longitude) do
    where(store_id: Store.near([latitude, longitude], 3).reorder(:id).ids)
  end
end
