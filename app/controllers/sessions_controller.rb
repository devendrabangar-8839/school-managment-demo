class SessionsController < ApplicationController
  before_action :current_user, except: [:create, :new]

  def index
    redirect_to root_path
  end
  
  def new
    
    user = User.new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash.now.alert = 'Email or password is invalid'
      redirect_to '/login'
    end
  end
  def destroy
  session[:user_id] = nil
  flash[:notice] = "You have been signed out!"
  redirect_to ''
  end

end
