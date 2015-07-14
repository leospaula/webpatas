class StoresController < ApplicationController
  def show
    @store = Store.find_by!(id: params[:id], blocked: false)
    @item = @store.items.find_by(id: params[:item_id])
    StoreAccess.create!(store: @store, ip: request.remote_ip)
  end
end
