class Public::CustomersController < ApplicationController


  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to public_customers_path(@customer)
  end

  def unsubscribe
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_active: '退会')
    reset_session
    redirect_to public_root_path
  end

  private
  def customer_params
    params.require(:customer).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_active)
  end
end
