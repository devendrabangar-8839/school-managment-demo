class StudentTeachersController < ApplicationController

  def index
    @student_teachers = StudentTeacher.all
  end

  def new
    @student_teacher = StudentTeacher.new
  end

  def create
    @student_teacher = StudentTeacher.new(student_teacher_params)
    
    if @student_teacher.save
      render new_student_teacher_path
    end
  end

  private
  def student_teacher_params
    params.require(:student_teacher).permit(:student_id, :teacher_id)
  end
  
end
