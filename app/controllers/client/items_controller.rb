class Client::ItemsController < ApplicationController
  def index
    @items = Item.all.order("created_at DESC").page(params[:page]).per(8)
    @genres = Genre.all
  end
  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    if client_signed_in?
      @cart_items = CartItem.where(client_id:[current_client.id])
    end
    @genres = Genre.all
  end
end