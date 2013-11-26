class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :from
      t.string :to
      t.string :content
      t.references :assignment, index: true
      t.references :student, index: true
      t.integer :order

      t.timestamps
    end
  end
end
