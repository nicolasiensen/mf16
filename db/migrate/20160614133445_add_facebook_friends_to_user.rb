class AddFacebookFriendsToUser < ActiveRecord::Migration
  def change
    add_column :users, :facebook_friends, :json
  end
end
