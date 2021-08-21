class Admin::OrderItemsController < ApplicationController
  def update
		@order_item = OrderItem.find(params[:id])
		@order = order_item.order
		@order_items = OrderItem.where(order_id: [order.id])
		@order_item.update(order_item_params)
		if params[:order_item][:] == "製作中"
			order.update!(order_status: 2)
		elsif params[:order_item][:create_status] == "製作完了"
			if order_items.all?{ |orderitem| orderitem.create_status == "製作完了" }
				order.update!(order_status: 3)
			end
		end
		redirect_to admin_order_path(order)
	end

	private
		def order_item_params
			params.require(:order_item).permit(:making_status)
		end
end
