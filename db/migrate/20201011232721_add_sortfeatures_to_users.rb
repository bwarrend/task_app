class AddSortfeaturesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :sort_by, :integer
    add_column :users, :show_complete, :boolean
  end
end
