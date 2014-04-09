class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


##added April 9th for users
  before_action :configure_devise_params, if: :devise_controller?

  private

##similar to an array that we used when making permanent perameters
  def configure_devise_params
    devise_parameter_sanitizer.for(:sign_up) <<
                                              [:first_name, :last_name]
    devise_parameter_sanitizer.for(:account_update) <<
                                              [:first_name, :last_name]
  end
end
