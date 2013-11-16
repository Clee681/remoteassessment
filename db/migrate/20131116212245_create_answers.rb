class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :response
      t.boolean :correct
      t.references :question, index: true
      t.references :student, index: true

      t.timestamps
    end
  end
end
