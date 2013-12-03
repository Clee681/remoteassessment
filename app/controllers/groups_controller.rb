class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.teacher_id = current_teacher.id

    if @group.save
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  def update
    @group = Group.find(params[:id])
    @group.student_groups.create(student_id: params[:group][:student_id])

    redirect_to group_path(@group)
  end

  def show
    @group = Group.find(params[:id])
    @students = Student.all
  end

  private
    def group_params
      params.require(:group).permit(:name)
    end
end
