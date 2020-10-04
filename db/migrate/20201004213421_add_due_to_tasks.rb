class AddDueToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :due_date, :datetime
    add_column :tasks, :is_complete, :boolean
  end
end
