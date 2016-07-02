class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  layout :layout_by_resource

  protected

  def configure_permitted_parameters
    extra_parameters = [:first_name, :last_name, :district, :cell_phone_number]
    devise_parameter_sanitizer.for(:sign_up).concat extra_parameters
    devise_parameter_sanitizer.for(:account_update).concat extra_parameters
  end

  def layout_by_resource
    if devise_controller? && resource_name == :user && action_name == "edit"
      "user"
    else
      "application"
    end
  end
end
