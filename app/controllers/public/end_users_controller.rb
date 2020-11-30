class Public::EndUsersController < ApplicationController
  def show
  end

  def edit
  end

  def unsubscribe
  end

  private
  def customer_params
    params.require(:customer).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number)
  end
end
