class AddColumnsToTasksTable < ActiveRecord::Migration
  def up
    add_column :tasks, :done, :boolean, :default => false
    add_column :tasks, :category_id, :integer
  end
  
  def down
    remove_column :tasks, :done
    remove_column :tasks, :category_id
  end
end
