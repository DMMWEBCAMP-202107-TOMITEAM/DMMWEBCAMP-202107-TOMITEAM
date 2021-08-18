class Client::ItemsController < ApplicationController
  def index
    @items = Item
  end
  def show
    @item = User.find(params[:id])
  end
end



