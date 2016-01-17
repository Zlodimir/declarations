class AddUserIdToDeclarations < ActiveRecord::Migration
  def change
    add_column :declarations, :user_id, :integer
    add_foreign_key :declarations, :users
    change_column_default(:declarations, :date, nil)
  end
end
