class AddShowIncompleteToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :show_incomplete, :boolean
  end
end
