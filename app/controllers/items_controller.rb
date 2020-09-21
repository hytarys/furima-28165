class ItemsController < ApplicationController

  before_action :get_item, only:[:edit, :update, :show, :destroy]
  
  def index
    @item = Item.all
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to action: :index
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    if @item.destroy
      redirect_to action: :index
    else
      redirect_to action: :show
    end
  end


  private

  def get_item
    @item = Item.find(params[:id])
  end
  
  def item_params
    params.require(:item).permit(:name, :created_at, :updated_at, :explanation, :price, :user, :category_id, :status_id, :delivery_fee_id, :shipping_origin_id, :shipping_span_id, :image).merge(user_id: current_user.id)
  end
end
