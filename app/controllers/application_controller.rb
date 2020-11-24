class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    admin_items_path(resource)
  end

  def after_sign_up_path_for(resource)
    admin_items_path(resource)
  end

  def after_sign_out_path_for(resource)
    admin_root_path(resource)
  end

end
