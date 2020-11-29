class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    case resource
     when Admin
      admin_orders_path
     when Customer
      public_end_user_path(@customer)
    end
  end

  def after_sign_up_path_for(resource)
    admin_items_path(resource)
  end

  def after_sign_out_path_for(resource)
    case resource
      when :admin
        admin_root_path
      when :customer
        public_root_path(resource)
    end
  end

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    added_attrs = [ :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email, :password, :password_confirmation　]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end

end
