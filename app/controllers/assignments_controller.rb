class AssignmentsController < ApplicationController
  def index
    @teacher = current_teacher
  end
end
