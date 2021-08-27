class Admin::OrderItemsController < ApplicationController
  def update
		@order_item = OrderItem.find(params[:id])
		@order = @order_item.order
		@order_items = OrderItem.where(order_id: [@order.id])
		@order_item.update(order_item_params)

		if params[:order_item][:making_status] == "producing"
			@order.update(order_status: "producing")
		elsif params[:order_item][:making_status] == "complete"
			if @order_items.all?{ |orderitem| orderitem.making_status == "complete" }
				@order.update(order_status:"ready_to_ship")
			end
		end
		redirect_to admin_order_path(@order)
	end

	private
		def order_item_params
			params.require(:order_item).permit(:making_status)
		end
end
