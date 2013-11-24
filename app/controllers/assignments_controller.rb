class AssignmentsController < ApplicationController
  def index
    @teacher = current_teacher
  end

  def new
  end
end
