class StudentTeachersController < ApplicationController
  def index
    @student_teachers = StudentTeacher.all
  end

  def show
    @student_teacher = StudentTeacher.find(params[:id])
  end

  def new
    @student_teacher = StudentTeacher.new
  end

  def create
    
    @student_teacher = StudentTeacher.new(studentteacher_params)
    if @student_teacher.save
      render new
    end
  end

  private
  def studentteacher_params
    params.require(:studentteacher).permit(:student_id, :teacher_id)
  end
  
end
