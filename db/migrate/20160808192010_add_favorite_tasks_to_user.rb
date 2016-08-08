class AddFavoriteTasksToUser < ActiveRecord::Migration
  def change
    add_column :users, :favorite_tasks, :string, array: true, default: []
  end
end
