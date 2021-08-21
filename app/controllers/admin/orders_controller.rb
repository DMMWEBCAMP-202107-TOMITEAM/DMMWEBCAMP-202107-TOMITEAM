class Admin::OrdersController < ApplicationController


 def index
    @orders = Order.all
 end

 def show
   @order = Order.find(params[:id])
   @order_items = OrderItem.find(params[:id])
   # @order_item = OrderItem.find(params[:making_status])
 end

 def  update
   order = Order.find(params[:id])
   order_details = order.order_details
   order.update(order_params)

		if order.order_status == "入金確認"
			 order_details.update_all(making_status: "製作待ち")
		end
		redirect_to admin_order_path(order.id)

 end

end