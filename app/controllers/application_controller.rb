class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def load_product
    @product = Product.find_by id: params[:id]
    if @product.nil?
      render file: "public/404.html", status: :not_found, layout: true
    end
  end

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up do |user_params|
      user_params.permit :fullname, :email, :password,
      :password_confirmation, :address, :phone_number
    end
    devise_parameter_sanitizer.permit :account_update do |user_params|
      user_params.permit :fullname, :email, :password,
      :password_confirmation, :current_password, :address, :phone_number
    end
  end
end
