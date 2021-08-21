class Client::OrdersController < ApplicationController
  def new
    @order = Order.new
    @cart_items = CartItem.where(client_id:[current_client.id])
    @adresses = Adresses.where(client_id:[current_client.id])
  end
  
  def index
    @orders = current_client.orders.all
  end
  
  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items.all
    
    #下3行は商品合計を出すため
    @sum = 0
    @subtotals = @order_items.map { |order_item| order_item.price * order_item.amount }
    @sum = @subtotals.sum
  end
  
  def check
    @cart_items = CartItem.where(client_id:[current_client.id])
    @order = Order.new
    @shipping_cost = 800
  end
  
  def create
    @cart_items = CartItem.where(client_id:[current_client.id])
    @order = Order.new
    @shipping_cost = 800
    if params[:page] == "new"
      render 'check'
    else
      if @order.payment_method == "銀行振り込"
        @order.order_status = 1
      end
      if @order.save
        @cart_items.each do |cart_item|
          OrderItem.create!(order_id: @order.id, count:cart_item.count, item_id:cart_item.item_id, price:cart_item.item.price)
        end
        @cart_items.destroy_all
        redirect_to '/thanks'
      else
        flash[:notice] = "項目に不備があります"
        redirect_to 'new'
      end
    end
  end
  
  def thanks
  end
  
  private
  
   def order_params
      params.require(:order).permit(:client_id, :postal_code, :address, :payment_method, :order_status, :shipping_cost, :total_payment)
   end

   def order_is_valid
      @cart_items = CartItem.where(client_id:[current_client.id])
      if @cart_items.present? == false
         redirect_to root_path
      end
   end
  
end
