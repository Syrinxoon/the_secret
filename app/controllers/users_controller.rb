class UsersController < ApplicationController
  skip_before_filter :check_authorization, only: [:new, :create]
  
  def index
    @users = User.includes(:authentications).all
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    
    if @user.save
      redirect_to secret_path, notice: "Welcome aboard #{@user.username}!"
    else
      render :new
    end
  end
end
