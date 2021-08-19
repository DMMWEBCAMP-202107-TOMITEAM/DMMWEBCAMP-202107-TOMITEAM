class Client::ItemsController < ApplicationController
  def index
    @items = Item.all
  end
  def show
    @item = Item.find(params[:id])
    # @cart = Cart_items.create
  end
end