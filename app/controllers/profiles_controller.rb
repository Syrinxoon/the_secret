class ProfilesController < ApplicationController
  def show
    @user = current_user
  end
  
  def update
    @user = current_user
    
    if @user.update_attributes(params[:user])
      redirect_to profile_url, notice: 'Password successfully updated.'
    else
      redirect_to profile_url, alert: 'Could not update your password.'
    end
  end
  
  def destroy
    current_user.destroy
    reset_session
    redirect_to root_path, notice: 'Your account has been successfully destroyed. Good bye! And do not tell our secret!'
  end
end
