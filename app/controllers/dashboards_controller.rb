class DashboardsController < ApplicationController
    before_action :authenticate_user!
    before_action :current_user, except: [:index]
    after_action :admin, only:[:sessios_new_path]

  def index
    if
     @current_user.teacher? 
     @teacher = Teacher.find_by(user_id: @current_user)
     redirect_to @teacher 
    elsif
      current_user.student?
      @student = Student.find_by(user_id: @current_user)
      redirect_to @student
    else
      current_user.admin?
      @admin = Admin.find_by(user_id: @current_user)
      redirect_to @admin
    end
  end

end