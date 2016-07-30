class AddWantsToDonateToUser < ActiveRecord::Migration
  def change
    add_column :users, :wants_to_donate, :bool
  end
end
