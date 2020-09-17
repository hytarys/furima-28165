class ItemsController < ApplicationController
  
  def index
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to action: :index
    else
      render("items/new")
    end
  end

  private
  
  def item_params
    params.require(:item).permit(:name, :created_at, :updated_at, :explanation, :price, :user, :category_id, :status_id, :delivery_fee_id, :shipping_origin_id, :shipping_span_id, :image).merge(user_id: current_user.id)
  end
end
