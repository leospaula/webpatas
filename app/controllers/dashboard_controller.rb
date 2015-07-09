class DashboardController < ApplicationController
  before_action :authenticate_store!
  def index
    @store = current_store
    @items = current_store.items
    if @items.any?
      redirect_to dashboard_items_path
    else
      redirect_to new_item_path
    end
  end

  def items
    @store = current_store
    @items = current_store.items.page(params[:page]).per(20)
  end
end
