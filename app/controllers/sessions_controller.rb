class SessionsController < ApplicationController
  def new
     user = User.new
  end

  def create
    
    user = User.find_by(email: params[:email])
    if user.presence && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to new_user_path, notice: 'Logged in!'
    else
      flash.now.alert = 'Email or password is invalid'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to posts_url, notice: 'Logged out!'
  end
end
