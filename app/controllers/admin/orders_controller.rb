class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.page(params[:page]).reverse_order
  end

  def show
    @order = Order.find(params[:id])
    @order_item_price = 0
    @order.order_items.each do |price|
      @order_item_price += (price.quantity.to_i * price.purchase_price * 1.1).round(0)
    end
    
    @total_price = 0
    @total_price += (@order_item_price + 800 )
  end

  private
    def order_params
      params.require(:order).permit(:customer_id, :payment, :address, :postal_code, :billing_amount, :created_at, :telephone_number)
    end

end
