class OrdersController < ApplicationController
  before_action :move_to_index, only: [:index]
  
  def index
    @order = OrderAddress.new
  end

  def create
    @order = OrderAddress.new(order_address_params)
    @item = Item.find(params[:item_id])
    if @order.valid?
      pay_item
      @order.save
      return redirect_to items_path
    else
      render :index
    end
  end

  private


  def pay_item
    Payjp.api_key = "sk_test_12668f90027596de9b299780"
    Payjp::Charge.create(
      amount: @item.price,
      card: order_address_params[:token],
      currency:'jpy'
    )
  end

  def order_address_params
    params.require(:order_address).permit(:token, :postcode, :prefecture_id, :city, :house_number, :building_name, :phone_number, :user_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user
      redirect_to root_path
    end
  end
end

