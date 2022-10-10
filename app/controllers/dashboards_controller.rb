class DashboardsController < ApplicationController
  before_action :authenticate_user!
  before_action :current_user, except: [:index]

  def index
    if @current_user.teacher? 
      @teacher = Teacher.find_by(user_id: @current_user.id)
      if @teacher
        redirect_to @teacher
      else
        redirect_to sessions_new_path
      end
    elsif
      @current_user.student?
      @student = Student.find_by(user_id: session[:user_id])
      if @student
        redirect_to @student
      else
        redirect_to sessions_new_path
      end
    else
      @current_user.admin?
      @admin = Admin.find_by(user_id: @current_user.id)
      if @admin
        redirect_to @admin
      else
        redirect_to sessions_new_path
      end
    end
  end

  def show
    begin
    rescue Exception => e
      flash.alert = "Route not found."
      redirect_to dashboards_path
    end
  end
end
