class ApplicationController < ActionController::Base
  before_action :basic_auth, :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :first_name_reading, :last_name, :last_name_reading, :birthday, :password, :password_confirmation])
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]#環境変数に置き換え
    end
  end
end
