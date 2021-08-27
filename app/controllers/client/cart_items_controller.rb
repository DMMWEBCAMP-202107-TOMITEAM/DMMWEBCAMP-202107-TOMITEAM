class Client::CartItemsController < ApplicationController
before_action :authenticate_client!
  def index
    @cart_items = current_client.cart_items.all
    # @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
    @total_price = 0
    @cart_items.each do |cart_item|

      @subtotal = (Item.find(cart_item.item_id).price.floor * 1.1 * cart_item.amount).floor
      @total_price += @subtotal
    end
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
      redirect_to cart_items_path
    else
      flash[:notice] = "個数を選択してください"
      redirect_to request.referer
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.amount = params[:cart_item][:id]
    @cart_item.update(cart_params)
    flash[:success] = '個数を変更しました'
    redirect_back(fallback_location: root_path)
  end

  private
		def cart_params
			params.require(:cart_item).permit(:item_id, :amount, :client_id)
		end

end
