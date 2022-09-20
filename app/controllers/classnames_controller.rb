class ClassnamesController < ApplicationController
def index
  @classnames = Classname.all
end
def new
    @classname = Classname.new
  end

  def create
    
    @classname = Classname.new(classname_params)
    if @classname.save
      redirect_to @classname
    end
  end
  def edit
    @classname = Classname.find(params[:id])
  end

  def classname_params
    params.require(:classname_params).permit(:name, :gender, :date_of_birth, :salery, :subject_name, :user_id)
  end
end
