class AdminsController < ApplicationController
  before_action :set_admin, only: [:edit, :update]

  def index
    @admins = Admin.all
  end

  def show
    begin
      @admin = Admin.find(params[:id])
    rescue Exception => e
      flash.alert = "Admin not found."
      redirect_to root_path
    end
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
  end

  def update    

    if @admin.update(admin_params)
      redirect_to @admin
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  
  def admin_params
    params.require(:admin).permit(:name, :gender, :date_of_birth, :user_id, :contact_number, :address)
  end

  def set_admin
    @admin = Admin.find(params[:id])
  end

end
