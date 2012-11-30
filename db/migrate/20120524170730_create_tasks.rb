class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :body
      t.integer :status
      t.integer :parent_id, :default => 0
      t.integer :sortable
      t.timestamps
    end
  end
end
