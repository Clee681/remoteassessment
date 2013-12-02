class CreateGroupAssignments < ActiveRecord::Migration
  def change
    create_table :group_assignments do |t|
      t.references :assignment, index: true
      t.references :group, index: true

      t.timestamps
    end
  end
end
