class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :restrict_access

private

  def restrict_access 
    authenticate_or_request_with_http_token do |api_key, token|
      User.find_by(api_key: api_key, email: request.headers['X-User-Email'])
    end     
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authenticate_user!
    redirect_to '/login' unless current_user
  end
end
