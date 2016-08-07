class CreateGroupSubscriptions < ActiveRecord::Migration
  def change
    create_table :group_subscriptions do |t|
      t.integer :group_id
      t.string :email
      t.string :phone

      t.timestamps null: false
    end
  end
end
