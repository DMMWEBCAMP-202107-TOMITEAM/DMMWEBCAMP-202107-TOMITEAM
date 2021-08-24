class Admin::OrdersController < ApplicationController


 def index
    @orders = Order.all
 end

 def show
   @order = Order.find(params[:id])
   @order_items = @order.order_items
   # @order_item = OrderItem.find(params[:making_status])
 end

 def  update
   @order = Order.find(params[:id])
   @order_items = @order.order_items

  if
   @order.update(order_params)
   if
    (@order.order_status == "confirm_payment")
     @order_items.each do |order_item|
     order_item.making_status = "wait"
     order_item.save
    end
   end

   if
   (@order.order_status == "wait_for_payment")
    @order_items.each do |order_item|
    order_item.making_status = "not_startable"
    order_item.save
    end
   end

  end

		redirect_to admin_order_path(@order.id)


		end
		# if order.order_status == "入金確認"
		# 	 order_status.update_all(making_status: "製作待ち")
		# end


private
	def order_params
		params.require(:order).permit(:order_status)
	end

end