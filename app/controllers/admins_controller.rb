class AdminsController < ApplicationController
  def index
    @admins = Admin.all
  end

  def show
    @admin = Admin.find(params[:id])
  end

  def new
    @admin = Admin.new
  end

  def create
    
    @admin = Admin.new(admin_params)
    if @admin.save
      redirect_to sessions_new_path 
      else
      redirect_to new_admins_path
    end
  end
  def edit
    @admin = Admin.find(params[:id])
  end

  def admin_params
    params.require(:admin).permit(:name, :gender, :date_of_birth, :user_id, :contact_number, :address)
  end
end
