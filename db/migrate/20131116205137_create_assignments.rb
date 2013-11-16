class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :name
      t.string :description
      t.datetime :datetime_to_send
      t.references :teacher, index: true

      t.timestamps
    end
  end
end
