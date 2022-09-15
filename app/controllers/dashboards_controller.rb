class DashboardsController < ApplicationController

  def index
    if current_user.student?
      @student = Student.find_by(user_id: @current_user)
    end
  end

end