class AddGroupByDateToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :group_by_date, :boolean
  end
end
