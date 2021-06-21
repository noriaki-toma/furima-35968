class ItemsController < ApplicationController
  before_action :basic_auth

  def index 
    # @item = Item.all
  end
  
  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'toma' && password == '1234'
    end
  end

end
