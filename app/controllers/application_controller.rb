class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

private

  def require_signin
    unless current_user
      session[:intended_url] = request.url
      redirect_to new_session_url, alert: "First, let's sign in."
    end
  end

  def current_user
    @current_user = User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def current_user?(user)
    current_user == user
  end

  helper_method :current_user?

  def is_an_admin?
    current_user && current_user.admin?
  end

  helper_method :is_an_admin?
end
