class DashboardsController < ApplicationController
    before_action :authenticate_user!
    before_action :current_user, except: [:index]

  def index
    if current_user.teacher?
      redirect_to teachers_path
    end
  end

end