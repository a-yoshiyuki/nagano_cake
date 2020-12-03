class Public::CartItemsController < ApplicationController
  def index
    @costmer = current_customer
    @cart_items = @costmer.cart_items
    @cart_item = CartItem.new
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.end_user_id = current_customer.id
    @cart_item.save
    redirect_to public_cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

end
