class Public::CustomersController < ApplicationController
  def show
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def unsubscribe
  end

  def withdraw
    @customer = current_customer
    #@customer.is_active = false　下のupdateの（）内に入っているので書く必要なし
    @customer.update(is_active: false)#（）内に更新したい情報のみ入れる　(is_active[カラム]: false[データ])
    reset_session #ログイン情報だけを消す　ログインの前に戻す
    redirect_to public_root_path
  end

  private
  def customer_params
    params.require(:customer).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_active)
  end
end
