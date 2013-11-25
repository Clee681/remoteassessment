class StudentsController < ApplicationController
  def new
    @student = Student.new
    @groups = current_teacher.groups
  end

  def create
    @student = Student.new(student_params)
    @student.group_ids = student_group_params["groups"]
    
    if @student.save
      redirect_to student_path(@student)
    else
      render :new
    end
  end

  def show
    @student = Student.find(params[:id])
  end

  private
    def student_params
      params.require(:student).permit(:name, :phone_number)
    end

    def student_group_params
      params.require(:student).permit(:groups => [])
    end
end
