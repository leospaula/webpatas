class ProductAccess < ActiveRecord::Base
  geocoded_by :address

  after_validation :geocode, unless: -> (obj){ (obj.latitude && obj.longitude) }

  belongs_to :product

  validates :ip, :product, presence: true
end
