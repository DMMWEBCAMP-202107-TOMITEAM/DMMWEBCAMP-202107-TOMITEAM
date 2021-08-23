class Client::ItemsController < ApplicationController

  def top
    @items = Item.order('id DESC').limit(4)
    # ASCだと古い順でDESCで新着順です。
    @genres=Genre.all
  end
  
  def index
    @items = Item.all.order("created_at DESC").page(params[:page]).per(8)
    @genres = Genre.all
  end
  
  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    if client_signed_in?
      @cart_items = CartItem.where(client_id:[current_client.id])
    end
    # if client_signed_in?
    #   if current_client.item_include?(@item)
    #     @cart_item = current_client.cart_items.find_by(item_id: @item.id)
    #   else
    #     @cart_item = CartItem.new
    #   end
    # else
    #   @cart_item = CartItem.new
    # end
  end
end