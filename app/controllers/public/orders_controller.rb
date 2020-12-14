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

      @costmer = current_customer
      @cart_items = @costmer.cart_items
      @cart_item = CartItem.new
      @cart_item_price = 0

      current_customer.cart_items.each do |price|
        @cart_item_price += (price.amount * price.item.price * 1.1).round(0)
      end

      @total_price = 0
      @total_price += (@cart_item_price + 800 )

    end

    def complete
    end

    def index
    end

    def show
    end

    def thanks
      @order = Order.new(order_params)
      @order.customer_id = current_customer.id
      @order.status = 0
      #@order.payment = params[:order][:payment]
      @order.save
      redirect_to complete_public_orders_path
    end

  private
    def order_params
      params.require(:order).permit(:customer_id, :payment, :address, :postal_code)
    end

end
