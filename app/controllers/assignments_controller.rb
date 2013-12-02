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

  def edit
    @assignment = Assignment.find(params[:id])
  end

  def update
    @assignment = Assignment.find(params[:id])
    @assignment.update(assignment_params)

    @assignment.questions.each do |question|
      question.update(content: params[:assignment][:questions][:"#{question.id}"][:content], correct_answer: params[:assignment][:questions][:"#{question.id}"][:correct_answer])
    end

    num_of_questions = @assignment.questions.length

    params[:assignment][:new_questions].each_with_index do |new_question, index|
      @assignment.questions.create(content: new_question[:content], correct_answer: new_question[:correct_answer], sequence: num_of_questions+index+1)
    end

    redirect_to assignment_path(@assignment)
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
