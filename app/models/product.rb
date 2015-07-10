class Product < ActiveRecord::Base
  has_many :items
  has_and_belongs_to_many :sub_categories

  validates :name, :description, :brand, :sku, :image_1, presence: true

  scope :having_items, -> { where(id: Item.uniq.pluck(:product_id)) }
  scope :with_name, -> (name) { where(%q{"products"."name" ~* ?}, name) }
  scope :with_filters, -> (filters) do
    products = all
    store_filters = filters.slice(:accept_credit_card, :accept_debit_card, :delivers)
    if store_filters.any?
      products = joins(items: :store).merge(Store.where(store_filters))
    end
    filters = filters.except(*store_filters.keys)
    products.tap { |collection| collection.where(filters) if filters.any? }.distinct
  end

  (1..4).each do |i|
    mount_uploader :"image_#{i}", ProductImageUploader
  end
end
