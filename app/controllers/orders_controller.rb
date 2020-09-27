class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @order = OrderAddress.new(order_address_params)
    if @order.valid?
      @item = Item.find(params[:item_id])
      pay_item
      @order.save
      return redirect_to items_path
    else
      redirect_to item_orders_path
    end
  end

  private

  def order_params
    params.permit(:token)
  end

  def pay_item
    Payjp.api_key = "sk_test_12668f90027596de9b299780"
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end

  def order_address_params
    params.permit(:postcode, :prefecture_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id).merge(user_id: current_user.id)
  end
end

