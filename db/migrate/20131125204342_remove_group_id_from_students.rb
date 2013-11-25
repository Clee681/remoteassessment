class RemoveGroupIdFromStudents < ActiveRecord::Migration
  def change
    remove_column :students, :group_id
  end
end
