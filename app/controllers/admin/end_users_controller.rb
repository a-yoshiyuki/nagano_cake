class Admin::EndUsersController < ApplicationController
  def index
    @customers = Customer.page(params[:page]).reverse_order
    @customer = Customer.new
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def new
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  private
  def customer_params
    params.require(:customer).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number)
  end
end
