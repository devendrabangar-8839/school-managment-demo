class SessionsController < ApplicationController
  before_action :authenticate_user!, except: [:create, :new]
  before_action :current_user, only:[:new, :show]
  

  def index
    redirect_to root_path
  end
  
  def new
    redirect_to root_path and return if current_user
  end

  def create
    @user = User.find_by(email: params[:email])
    
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      session[:role] = @user.role
      redirect_to sessions_new_path
    else
      flash.now.alert = 'Email or password is invalid'
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    session[:role] = nil
    flash[:notice] = "You have been signed out!"
    redirect_to '/logout'
  end

end
