class AddColumnChoiceIdToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :choice_id, :integer
    add_index :answers, :choice_id
  end
end
