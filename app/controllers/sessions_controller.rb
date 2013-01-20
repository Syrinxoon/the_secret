class SessionsController < ApplicationController
  skip_before_filter :check_authorization
  
  def new
  end
  
  def create
    @user = User.find_by_username(params[:username])

    redirect_to(new_session_path, alert: 'Could not find this user.') unless @user
    
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to secret_path, notice: "Welcome #{@user.username}"
    else
      redirect_to new_session_path, alert: 'Invalid credentials.'
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: "See you soon!"
  end
end
