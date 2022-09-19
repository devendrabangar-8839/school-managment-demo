class TeachersController < ApplicationController
  def index
    @teachers = Teacher.all
  end

  def show
    @teacher = Teacher.find(params[:id])
    
  end

  def new
    @teacher = Teacher.new
  end

  def create
    
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      redirect_to sessions_new_path 
      else
      redirect_to new_teacher_path
    end
  end
  def edit
    @teacher = Teacher.find(params[:id])
  end

  def teacher_params
    params.require(:teacher).permit(:name, :gender, :date_of_birth, :salery, :subject_name, :user_id)
  end
end
