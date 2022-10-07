class StudentsController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :verify_role, only:[:show]
  before_action :set_student, only: [:edit, :update, :destroy]
  

  def index
    @students = Student.all
  end

  def show
    redirect_to root_path if @current_user.teacher?
    begin
      str = params[:id] !~ /\D/
      if str

        @student = Student.find_by(id: params[:id])
        @array = []
        @teacher = StudentTeacher.where(student_id: params[:id]).pluck(:teacher_id).uniq
        @teacher.each do |id|
          teacher_objects = Teacher.find_by(id: id)
          teacher_name = teacher_objects&.name
          @array << teacher_name 
        end
        @array
      else
        redirect_to root_path
      end
    rescue Exception => e
      flash.alert = "User not found."
      redirect_to dashboards_path
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

  private

  def student_params
    params.require(:student).permit(:name, :father_name,  :gender, :date_of_birth, :roll_no, :user_id, :contact_number,
     :address)
  end

  def set_student
    @student = Student.find_by(id: params[:id])
    unless @student
      flash[:notice] = 'Invalid ID passed'
      redirect_to sessions_new_path
    end
  end 

  def verify_role

    unless['student'].include? session[:role]
      flash[:notice] = 'You cannot see this page'
      redirect_to sessions_new_path
    end
  end

end
