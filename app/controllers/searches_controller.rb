class SearchesController < ApplicationController
  def show
    return unless params[:q] # Skip search logic unless have a query
    search = Search.public_products(params, request.remote_ip)
    if search.valid?
      if search.object.direct?
        redirect_to_product(search)
      else
        @products = search
      end
    else
      flash[:alert] = search.errors.join(', ')
    end
  end

  private

  def redirect_to_product(search)
    redirect_params = {
      id: search.object.product,
      address: (search.object.address_formatted ||search.object.address),
      latitude: search.object.latitude,
      longitude: search.object.longitude,
      direct: true
    }
    redirect_to product_path(redirect_params)
  end
end
