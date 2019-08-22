class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def authenticate
  	redirect_to :login unless user_signed_in?
  end

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def find_user(google_auth)
    User.find_by(email: google_auth.info.email)
  end

  def user_signed_in?
  	!!current_user
  end
  
end
