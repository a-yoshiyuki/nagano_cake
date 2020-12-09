class Public::OrdersController < ApplicationController
  def new
  end

  def confirmation
    @payment = Order.new
  end

  def complete
  end

  def index
  end

  def show
  end
end
