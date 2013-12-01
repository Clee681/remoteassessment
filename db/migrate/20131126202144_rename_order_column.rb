class RenameOrderColumn < ActiveRecord::Migration
  def change
    rename_column :questions, :order, :sequence
  end
end
