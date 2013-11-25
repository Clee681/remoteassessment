class ChangeTeacherPhoneNumberDataTypeToTeachers < ActiveRecord::Migration
  def change
    change_column :teachers, :phone_number, :string
  end
end
