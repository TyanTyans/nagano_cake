class Admin::OrdersController < ApplicationController
  
  def index
    @orders = Order
  end
  
  def show
    @order = Order.find(params[:id])
    @items = @order.orderd_items
  end
  
end
