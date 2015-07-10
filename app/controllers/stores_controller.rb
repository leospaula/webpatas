class StoresController < ApplicationController
  def show
    @store = Store.find(params[:id])
    StoreAccess.create!(store: @store, ip: request.remote_ip)
  end
end
