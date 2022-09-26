class StudentTeacherController < ApplicationController
  def index
    @studentteachers = StudentTeacher.all
  end
  def show
    @studentteacher = StudentTeacher.find(params[:id])
  end

  def new
    @studentteacher = StudentTeacher.new
  end

  def create
    
    @studentteacher = StudentTeacher.new(teacher_params)
    if @studentteacher.save
      render new
    end
  end


end
