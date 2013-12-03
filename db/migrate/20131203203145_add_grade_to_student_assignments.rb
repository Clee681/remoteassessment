class AddGradeToStudentAssignments < ActiveRecord::Migration
  def change
    add_column :student_assignments, :grade, :decimal
  end
end
