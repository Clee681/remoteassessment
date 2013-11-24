class TeachersController < ApplicationController
  def show
    if teacher_signed_in?
      @teacher = Teacher.find(current_teacher.id)
    end
  end
end
