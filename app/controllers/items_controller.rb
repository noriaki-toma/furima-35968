class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new ]

  def index 
    #@item = Item.all
  end
  
  def new
    @item = Item.new
  end

end