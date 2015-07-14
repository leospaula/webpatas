class SearchResult
  attr_accessor :address, :address_formatted, :latitude, :longitude, :q, :ip,
    :product_id, :direct, :brand, :credit, :debit, :delivers
  alias_method :query, :q

  def initialize(params, ip)
    attrs = %i(address address_formatted latitude longitude q product_id direct
               brand credit debit delivers)
    params.slice(*attrs).each do |attr, value|
      send("#{attr}=", value)
    end
    self.ip = ip
    if latitude.blank? || longitude.blank?
      self.latitude, self.longitude = Geocoder.coordinates(address_formatted || address)
    end
  end

  %i(direct credit debit delivers).each do |attr|
    define_method("#{attr}?") do
      ActiveRecord::ConnectionAdapters::Column::TRUE_VALUES.include?(send(attr))
    end
  end

  def brand?
    brand.present? && brand.any?
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

  def items(the_product = product)
    @items ||= the_product.items.scoped_near(latitude, longitude).with_store_filters(filters).reorder(price: :asc)
  end

  def products
    @products ||= Product.having_items.with_name(query).with_filters(filters)
  end

  def filters
    {
      blocked: false
    }.tap do |filters|
      filters[:brand] = brand if brand.present?
      filters[:accept_credit_card] = true if credit?
      filters[:accept_debit_card] = true if debit?
      filters[:delivers] = true if delivers?
    end
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
      items = items(product)
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
