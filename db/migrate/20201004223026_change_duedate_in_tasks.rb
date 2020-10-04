class ChangeDuedateInTasks < ActiveRecord::Migration[6.0]
  def change
    remove_column :tasks, :due_date
    add_column :tasks, :due_date, :date
  end
end
