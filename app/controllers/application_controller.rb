class ApplicationController < ActionController::Base
  
  helper_method :current_user
  helper_method :authenticate_user!
  helper_method :logged_in?
  helper_method :logged_in

  private

  def current_user
    
    @current_user ||= User.find(session[:user_id]) if session[:user_id]    
  end

  def authenticate_user!
    unless current_user 
      redirect_to login_path
    end
  end
  
  def logged_in?
    !!current_user
  end

  def logged_in
    @user = User.all
    flash.now[:notice] = "you have #{@user} already logged in."
    redirect_to root_path
  end 

  def nill_user
    
    session[:user_id] == params[:user_id] 
  end

end
