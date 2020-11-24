class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.page(params[:page]).reverse_order
    @order = Order.new
  end

  def show
  end
end
