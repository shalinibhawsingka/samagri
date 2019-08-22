class SessionsController < ApplicationController
  def create
    google_auth = request.env["omniauth.auth"]

    if google_auth.info.email.present?
      @user = find_user(google_auth)
      session[:user_id] = @user.id
      redirect_to show_path
    else
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
