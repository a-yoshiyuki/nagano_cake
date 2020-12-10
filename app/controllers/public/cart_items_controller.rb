class Public::CartItemsController < ApplicationController
  def index
    @costmer = current_customer
    @cart_items = @costmer.cart_items
    @cart_item = CartItem.new
    @cart_item_price = 0

    current_customer.cart_items.each do |price|
      @cart_item_price += (price.amount * price.item.price * 1.1).round(0)
    end
    
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    if CartItem.find_by(customer_id: current_customer.id, item_id: params[:cart_item][:item_id]).present?
      present_ci = CartItem.find_by(customer_id: current_customer.id, item_id: params[:cart_item][:item_id])
      present_ci.amount = present_ci.amount.to_i + params[:cart_item][:amount].to_i
      present_ci.update(amount: present_ci.amount)
    else
      @cart_item.customer_id = current_customer.id
      @cart_item.save
    end
    redirect_to public_cart_items_path
  end

  def update
    @cart_items = CartItem.find(params[:id])
    @cart_items.update(cart_item_params)
    redirect_to public_cart_items_path
  end

  def destroy
    @cart_items = CartItem.find(params[:id])
    @cart_items.destroy
    redirect_to public_cart_items_path, notice: "カート内の商品を削除しました。"
  end

  def destroy_all
    @cart_items = CartItem.where(params[:id])
    CartItem.destroy_all
    redirect_to public_cart_items_path, notice: "カート内の商品を全て削除しました。"
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

end
