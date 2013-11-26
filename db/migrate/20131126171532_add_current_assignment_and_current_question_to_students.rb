class AddCurrentAssignmentAndCurrentQuestionToStudents < ActiveRecord::Migration
  def change
    add_column :students, :current_assignment, :integer
    add_column :students, :current_question, :integer
  end
end
