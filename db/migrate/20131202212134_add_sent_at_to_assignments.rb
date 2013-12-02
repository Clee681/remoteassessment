class AddSentAtToAssignments < ActiveRecord::Migration
  def change
    add_column :assignments, :sent_at, :datetime
  end
end
