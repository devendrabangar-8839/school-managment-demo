class ApplicationController < ActionController::Base
  before_action :require_user, only: [:index, :show]
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

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
end
