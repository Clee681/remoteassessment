class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :content
      t.references :assignment, index: true

      t.timestamps
    end
  end
end
