class AssignmentsController < ApplicationController
  def index
    @teacher = current_teacher
  end

  def new
    @assignment = Assignment.new
  end

  def show
    @assignment = Assignment.find(params[:id])
  end

  def create
    @assignment = Assignment.new(assignment_params)
    @assignment.teacher_id = current_teacher.id

    if @assignment.save
      redirect_to assignment_path(@assignment), notice: "You succesfully created a new assignment!"
    else
      render :new
    end
  end

  private
    def assignment_params
      params.require(:assignment).permit(:name, :description)
    end
end
