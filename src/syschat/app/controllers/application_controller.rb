class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def logged_in? 
    unless session[:user_id] 
      flash[:notice] = "You need to sign in first." 
      redirect_to root_path
      return false 
    else 
      return true 
    end 
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end



end


