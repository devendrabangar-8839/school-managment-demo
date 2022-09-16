class ApplicationController < ActionController::Base
  
  before_action :current_user, only: [:index]
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?
  before_action :require_login

  private

  def current_user
    @current_user = (User.find_by(id: session[:user_id]) || User.new)
  end
  def require_user
    redirect_to '/login' unless current_user
  end
  
  def logged_in?
    current_user
  end

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to sessions_new_path # halts request cycle
    end
  end
end
