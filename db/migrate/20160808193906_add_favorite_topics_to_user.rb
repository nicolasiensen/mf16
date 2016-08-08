class AddFavoriteTopicsToUser < ActiveRecord::Migration
  def change
    add_column :users, :favorite_topics, :string, array: true, default: []
  end
end
