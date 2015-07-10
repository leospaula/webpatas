class ProductsController < ApplicationController
  before_action :redirect_without_address, only: %i(show)

  def index
    respond_to do |format|
      format.json do
        render json: Product.with_name(params[:q]).pluck(:id, :name)
      end
    end
  end

  def show
    @product = Product.find(params[:id])
    ProductAccess.create!(product: @product, ip: request.remote_ip,
                          address: params[:address], latitude: params[:latitude],
                          longitude: params[:longitude])
    search = SearchResult.new(params.merge(product_id: params[:id]), request.remote_ip)
    @items = search.fetch
  end

  private

  def redirect_without_address
    if params[:address].blank?
      redirect_to root_path(q: params[:q], product_id: params[:id]), notice: 'Falta informar sua área de busca'
    end
  end
end
