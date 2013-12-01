class RemoveColumnOrderFromMessages < ActiveRecord::Migration
  def change
    remove_column :messages, :order
  end
end
