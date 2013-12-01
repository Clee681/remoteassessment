class AddResettingAssignmentToStudent < ActiveRecord::Migration
  def change
    add_column :students, :resetting_assignment, :boolean
  end
end
