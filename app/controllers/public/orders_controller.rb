class Public::OrdersController < ApplicationController
    def new
      @order = Order.new
    end

    def confirmation
      @order = Order.new(order_params)
      @order.customer_id = current_customer.id
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.shipping = 0
      @order.status = 0
      
    end

    def complete
    end

    def index
    end

    def show
    end

  private
    def order_params
      params.require(:order).permit(:customer_id, :payment)
    end

end
