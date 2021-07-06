class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item

  def index
    @order_address = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_address).permit(:postal, :prefecture_id, :city, :address1, :address2, :telephone).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

end
