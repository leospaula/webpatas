class Search < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode, unless: ->(obj){ (obj.latitude && obj.longitude) }

  def self.public_products(params, ip)
    result = SearchResult.new(params, ip)
    if result.valid?
      SearchResult::Object.new(true, result.fetch, result.direct?, !result.direct?, result.errors, result)
    else
      SearchResult::Object.new(false, Product.none, false, false, result.errors, result)
    end
  end
end
