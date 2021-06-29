class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, ]

  def index 
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end


  private
  def item_params
    params.require(:item).permit(:image, :name, :category_id, :text, :condition_id, :price, :postage_id, :shipping_day_id, :prefecture_id).merge(user_id: current_user.id)
  end

end