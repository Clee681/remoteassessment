class ChangeStudentPhoneNumberDataTypeToStudents < ActiveRecord::Migration
  def change
    change_column :students, :phone_number, :string
  end
end
