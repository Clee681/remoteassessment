class AddPhoneNumberToTeacher < ActiveRecord::Migration
  def change
    add_column :teachers, :phone_number, :integer
  end
end
