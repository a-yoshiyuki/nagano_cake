class Admin::EndUsersController < ApplicationController
  def index
    @customers = Customer.page(params[:page]).reverse_order
    @customer = Customer.new
  end

  def show
  end

  def new
  end

  def edit
  end
end
