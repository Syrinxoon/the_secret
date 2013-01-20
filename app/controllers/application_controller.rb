class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :check_authorization
  
  private
  
  def check_authorization
    redirect_to(new_session_path) unless current_user
  end
  
  def current_user
    @user || User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end
