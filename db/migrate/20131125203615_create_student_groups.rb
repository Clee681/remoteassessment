class CreateStudentGroups < ActiveRecord::Migration
  def change
    create_table :student_groups do |t|
      t.references :student, index: true
      t.references :group, index: true

      t.timestamps
    end
  end
end
