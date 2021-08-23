class Client::OrdersController < ApplicationController
  def new
    @order = Order.new
    @client = Client.find(current_client.id)
    @shipping_addresses = @client.adresses

    # @cart_items = CartItem.where(client_id:[current_client.id])
    # @adresses = Adress.where(client_id:[current_client.id])
  end

  def index
    @orders = current_client.orders.all
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items.all

    # 下3行は商品合計を出すため
    @sum = 0
    @subtotals = @order_items.map { |order_item| order_item.price * order_item.amount }
    @sum = @subtotals.sum
  end

  def check

    @cart_items = current_client.cart_items.all
    @address = current_client.address
    @order = Order.new(order_params)
    @order.client_id = current_client.id
    # @order.payment_method = session[:order][:payment_method]

      if params[:order][:address_op] == "1"
        @order.postal_code = current_client.postal_code
        @order.address = current_client.address
        @order.name = "#{current_client.first_name}#{current_client.last_name}"
      elsif params[:order][:address_op] == "2"
        address = Adress.find(params[:order][:address_id])
        @order.address = address.address
        @order.name = address.name
        @order.postal_code = address.postal_code
      else params[:order][:address_op] == "3"
      end
    @shipping_cost = 800




  end

  def create
    @cart_items = CartItem.where(client_id:[current_client.id])
    @order = Order.new(order_params)
    @shipping_cost = 800
    if params[:page] == "new"
      render 'check'
    else
      if @order.payment_method == "銀行振り込"
        @order.order_status = 1
      end
      if @order.save
        @cart_items.each do |cart_item|
          OrderItem.create!(order_id: @order.id, amount:cart_item.amount, item_id:cart_item.item_id, price:cart_item.item.price)
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
