class AddListIdToStudentAssignment < ActiveRecord::Migration
  def change
    add_column :student_assignments, :list_id, :integer
    add_index :student_assignments, :list_id
  end
end
