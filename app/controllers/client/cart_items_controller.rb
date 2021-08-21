class Client::CartItemsController < ApplicationController

  def index
    @cart_items = current_client.cart_items.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
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

  def create
    @cart_item = CartItem.new(cart_params)
    if @cart_item.save
      redirect_to cart_items_path(@cart_item)
    else
      flash[:notice] = "個数を選択してください"
      redirect_to request.referer
    end
  end

  private
		def cart_params
			params.require(:cart_item).permit(:item_id, :amount, :client_id)
		end

end
