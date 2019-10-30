class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :current_admin?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
    if current_user.nil?
      flash[:error] = "Please sign in to see this content."
      redirect_to root_path
    end
  end

  def current_admin?
    current_user && current_user.admin?
  end
end
