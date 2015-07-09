class ItemsController < ApplicationController
  after_action :verify_authorized, except: %i(index show)

  def index
    respond_to do |format|
      format.json do
        render json: Product.having_items.with_name(params[:q]).pluck(:id, :name)
      end
      format.html do
      end
    end
  end

  def show
    @item = Item.includes(:product).find(params[:id])
  end

  def new
    @product = if params[:product_id]
                 Product.find(params[:product_id])
               else
                 Product.new
               end
    @item = Item.new(available: true, product: @product, store: current_store)
    authorize(@item)
  end

  def create
    @item = Item.new(permitted_params.merge(store: current_store))
    authorize(@item)
    if @item.save
      redirect_to new_item_path, notice: 'Produto adicionado com sucesso'
    else
      flash[:alert] = @item.errors.full_messages.join(', ')
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
    authorize(@item)
  end

  def update
    @item = Item.find(params[:id])
    authorize(@item)
    if @item.update_attributes(permitted_params)
      redirect_to new_item_path, notice: 'Criado com sucesso'
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    authorize(@item)
    @item.destroy
    redirect_to new_item_path
  end

  private

  def permitted_params
    params.require(:item).permit(*policy(Item).permitted_attributes)
  end
end
