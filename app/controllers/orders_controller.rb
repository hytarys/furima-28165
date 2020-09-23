class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @order = Order.new(item_id: params[:item_id], user_id: current_user.id)
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
end

