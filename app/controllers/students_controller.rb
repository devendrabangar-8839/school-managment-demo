class StudentsController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :verify_role, only:[:show, :update]
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_action :index_condition, only: [:index, :destroy]

  def index
    @students = Student.all
  end

  def show
    redirect_to root_path if @current_user.teacher?
    if @current_user.admin?      
      
      @student = Student.find_by(id: params[:id])
      @array = []
      @studentteachers = StudentTeacher.where(student_id: params[:id]).includes(:teacher)
      @studentteachers.each do |sn|
        teacher_name = sn.teacher&.name
        @array << teacher_name 
      end   
    else
      @student = Student.find_by(user_id: session[:user_id])
      #u = @student.user #User.find(session[:user_id]).student.id 
      @array = []
      @studentteachers = StudentTeacher.where(student_id: @student).includes(:teacher)
      @studentteachers.each do |sn|
        teacher_name = sn.teacher&.name
        @array << teacher_name 
      end  
    end
  end

  def new    
    @student = Student.new
  end
 
  def create
    @student = Student.new(student_params)
  
    if @student.save
      redirect_to sessions_new_path 
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @student.update(student_params)
      redirect_to @student
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @student.destroy  
  end

  def admin_student
    
    
  end

  private

  def student_params
    params.require(:student).permit(:name, :father_name,  :gender, :date_of_birth, :roll_no, :user_id, :contact_number,
     :address)
  end

  def set_student
    @student = Student.find_by(id: params[:id])
    unless @student
      flash[:notice] = 'Invalid ID passed, please Login your Account!'
      redirect_to sessions_new_path
    end
  end 

  def verify_role
    unless['student', 'admin'].include? current_user.role
      flash[:notice] = 'You cannot see this page'
      redirect_to sessions_new_path
    end
  end

  def index_condition
    unless current_user.admin
      flash[:notice] = 'You dont have access this page, Please Login!'
      redirect_to root_path
    end
  end
end
