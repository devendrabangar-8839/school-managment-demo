class TeachersController < ApplicationController

  before_action :authenticate_user!, only: [:show]
  before_action :verify_role, only: [:show]
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]
  before_action :index_condition, only: [:index, :destroy]

  def index
    #redirect_to root_path if @current_user.is_admin?
    @teachers = Teacher.all
  end

  def show
    redirect_to root_path if @current_user.student?
    if @current_user.admin?
      
      @teacher = Teacher.find_by(id: params[:id])
      @array = []
      studentteachers = StudentTeacher.where(teacher_id: params[:id]).includes(:student)
      studentteachers.each do |sn|
        student_name = sn.student&.name
        @array << student_name 
      end           
    else
      @teacher = Teacher.find_by(user_id: session[:user_id])
      @array = []
      studentteachers = StudentTeacher.where(teacher_id: @teacher).includes(:student)
      studentteachers.each do |sn|
        student_name = sn.student&.name
        @array << student_name 
      end         
    end
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      redirect_to login_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @teacher.update(teacher_params)
      redirect_to @teacher
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @teacher.destroy 
    flash[:notice] = 'teacher Destroy Successfull!'
    redirect_to root_path 
  end

  private

  def teacher_params
    params.require(:teacher).permit(:name, :gender, :date_of_birth, :salery, :subject_name, :user_id, :contact_number,
     :address)
  end

  def set_teacher
    @teacher = Teacher.find_by(id: params[:id])
    unless @teacher
      flash[:notice] = 'Invalid ID passed, please Login your Account!'
      redirect_to sessions_new_path
    end
  end

  def verify_role
    unless ['admin', 'teacher'].include? current_user.role
      flash[:notice] = 'You cannot see this page'
      redirect_to sessions_new_path
    end
  end

  def index_condition
    unless current_user.admin
      flash[:notice] = 'You dont have access this page, Please contact Admin!'
      redirect_to root_path
    end
  end
end
