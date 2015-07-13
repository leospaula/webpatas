class Item < ActiveRecord::Base
  belongs_to :product
  belongs_to :store

  validates :price, :store, presence: true

  delegate :name, :description, :technical_information, :brand, :reference,
    :sku, :image_1, :image_2, :image_3, :image_1?, :image_2?, :image_3?,
    :sub_categories, to: :product

  delegate :name, :delivers?, :accept_credit_card?, :accept_debit_card?,
    :accept_card?, to: :store, prefix: true

  scope :with_name, -> (name) { where(product: Product.with_name(name)) }
  scope :scoped_near, -> (latitude, longitude) do
    where(store_id: Store.near([latitude, longitude], 3).reorder(:id).ids)
  end
  scope :with_store_filters, -> (filters) do
    filters = filters.slice(:accept_credit_card, :accept_debit_card, :delivers)
    joins(:store).merge(Store.where(filters)) if filters.any?
  end
end
