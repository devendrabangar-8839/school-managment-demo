class TeachersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
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
  def update
    @teacher = Teacher.find(params[:id])

    if @teacher.update(teacher_params)
      redirect_to @teacher
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    @teacher = Teacher.find(params[:id])
    @teacher.destroy
  
  end

  def teacher_params
    params.require(:teacher).permit(:name, :gender, :date_of_birth, :salery, :subject_name, :user_id, :contact_number,
     :address)
  end
end
