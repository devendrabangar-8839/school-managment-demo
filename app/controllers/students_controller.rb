class StudentsController < ApplicationController
def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end


  def create
    # @user = User.find_by(params[:id])
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student
    else
      render :new, status: :unprocessable_entity
    end
  end
  def edit
    @student = Student.find(params[:id])
  end
  def update
    @student = Student.find(params[:id])

    if @student.update(student_params)
      redirect_to @student
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def student_params
    params.require(:student).permit(:name, :father_name,  :gender, :date_of_birth, :roll_no, :user_id)
  end
end
