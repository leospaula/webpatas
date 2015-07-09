class SearchResult
  attr_accessor :address, :address_formatted, :latitude, :longitude, :q, :ip,
    :product_id, :direct
  alias_method :query, :q

  def initialize(params, ip)
    attrs = %i(address address_formatted latitude longitude q product_id direct)
    params.slice(*attrs).each do |attr, value|
      send("#{attr}=", value)
    end
    self.ip = ip
  end

  def direct?
    ActiveRecord::ConnectionAdapters::Column::TRUE_VALUES.include?(direct)
  end

  def valid?
    errors.empty?
  end

  def fetch
    search_hash = {
      query: query,
      autocomplete: direct,
      ip: ip,
      address: (address_formatted || address),
      latitude: latitude,
      longitude: longitude
    }
    Search.create(search_hash)
    if product_id.present?
      items
    else
      products
    end
  end

  def items
    @items ||= product.items.scoped_near(latitude, longitude).reorder(price: :asc)
  end

  def products
    @products ||= Product.with_name(query)
  end

  def product
    @product ||= Product.find(product_id) if product_id.present?
  end

  def errors
    [].tap do |errors|
      errors << I18n.t('search.errors.empty_query') unless query.present?
      errors << I18n.t('search.errors.empty_address') unless have_address?
    end
  end

  def list_results
    products.map do |product|
      items = product.items.scoped_near(latitude, longitude)
      ListProduct.new(items.minimum(:price), items.maximum(:price), items.count, product)
    end
  end

  ListProduct = Struct.new(:min_price, :max_price, :stores_count, :product)
  Object = Struct.new(:valid?, :results, :item?, :product?, :errors, :object)

  private

  def have_address?
    address.present? || (latitude.present? && longitude.present?)
  end
end
