class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.string :content
      t.string :option
      t.boolean :correctness
      t.references :question, index: true

      t.timestamps
    end
  end
end
