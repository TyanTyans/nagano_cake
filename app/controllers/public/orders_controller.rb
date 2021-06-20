class Public::OrdersController < ApplicationController

  before_action :authenticate_customer!

	def new
		@order=Order.new
	end

	def create
		order=Order.new(order_params)
		order.save
		redirect_to orders_thanks_path
	end

	def thanks
		@cart_items=CartItem.all
	end

	def complete
	end

#会員の注文履歴一覧表示(うえ)
	def index
		@orders = current_customer.orders
	end

	def show
		@order = Order.find(params[:id])
    @item_orders = @order.item_orders
	end

private

	def order_params
		params.require(:order).permit(:pay_method, :zip_code, :address, :name)
	end

end
