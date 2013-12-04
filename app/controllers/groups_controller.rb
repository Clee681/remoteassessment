class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.teacher_id = current_teacher.id

    new_students_params[:new_students].each do |student|
      @group.students.build(student) unless student[:name].empty? || student[:phone_number].empty?
    end

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

    def new_students_params
      params.permit(:new_students => [:name, :phone_number])
    end
end
