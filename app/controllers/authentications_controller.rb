class AuthenticationsController < ApplicationController
  skip_before_filter :check_authorization, only: :omniauth
  
  def omniauth
    authentication = Authentication.from_omniauth(env["omniauth.auth"]).first
    
    if authentication
      @user = authentication.user
      session[:user_id] = @user.id
      redirect_to secret_path, notice: "Welcome #{@user.username}"
    elsif current_user
      provider = env["omniauth.auth"]["provider"]
      uid = env["omniauth.auth"]["uid"]
      
      current_user.authentications.create!(provider: provider, uid: uid)
      redirect_to profile_url, notice: "#{provider.titleize} successfully added."
    else
      @user = User.create_from_omniauth(env["omniauth.auth"])
      session[:user_id] = @user.id
      redirect_to secret_path, notice: "Welcome #{@user.username}"
    end
    
    
  end
  
  def destroy
    @authentication = current_user.authentications.find(params[:id])
    
    if @authentication
      @authentication.destroy
      redirect_to profile_url, notice: "#{@authentication.provider.titleize} has been removed from your social networks."
    else
      redirect_to profile_url, alert: "#{@authentication.provider.titleize} could not be removed from your social networks."
    end
  end
end
