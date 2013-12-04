class GroupsController < ApplicationController
  def index
    @groups = Group.where(teacher_id: current_teacher.id)
  end

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
    
    unless params[:group].nil?
      params[:group][:student_ids].each do |student_id|
        @group.student_groups.create(student_id: student_id)
      end
    end

    redirect_to group_path(@group)
  end

  def show
    @group = Group.find(params[:id])
    @students = Student.all
  end

  def destroy_student_group
    student_group_data = JSON.parse(params["data"])

    student_id = student_group_data.first.split('-').last
    group_id = student_group_data[1].split('-').last

    student = Student.find(student_id)
    student.student_groups.where(group_id: group_id).first.destroy

    redirect_to group_path(@group)
  end

  private
    def group_params
      params.require(:group).permit(:name)
    end
end
