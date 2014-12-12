class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Devise
  def after_sign_in_path_for(resource)
    # go to profile after signing in
  end

  def after_update_path_for(resource)
    # path to go to after updating profile
  end

end
