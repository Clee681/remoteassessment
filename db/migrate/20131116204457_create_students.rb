class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.integer :phone_number
      t.references :group, index: true

      t.timestamps
    end
  end
end
