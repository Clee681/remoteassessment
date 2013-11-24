class StaticController < ApplicationController
  def index
    if teacher_signed_in?
      redirect_to teachers_path
    end
  end

  def about
  end
end
