class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :logged_in, only: [:show]

  def index
    @users = User.all
  end

  def show
    redirect_to root_path and return if current_user
    @user = User.find(params[:id])
  end

  def new
    redirect_to root_path and return if current_user
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      UserMailer.welcome_email(@user.id).deliver_now
      session[:user_id] = @user.id
      if @user.student?
        redirect_to new_student_path(user_id: @user.id) 
      elsif @user.teacher?
        redirect_to new_teacher_path(user_id: @user.id)
      elsif @user.admin?
        redirect_to new_admin_path(user_id: @user.id)
      else
        redirect_to new_user_path
      end
    end
  end
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to root_path, status: :see_other
  end

  def user_params
    params.require(:user).permit(:email, :password, :role)
  end

end
