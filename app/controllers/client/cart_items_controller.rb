class Client::CartItemsController < ApplicationController
  
  def index
    @cart_items = current_client.cart_items
  end
  
  def destroy
		@cart_item = CartItem.find(params[:id])
		@cart_item.destroy
		redirect_to cart_items_path
	end
  
  def destroy_all
    @cart_items = current_client.cart_items
    @cart_items.destroy_all
    redirect_to cart_items_path
  end
  
end
