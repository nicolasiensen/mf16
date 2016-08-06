class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :kind
      t.string :name
      t.string :district
      t.string :address
      t.string :email
      t.string :phone
      t.string :facebook_page
      t.string :facebook_group

      t.timestamps null: false
    end
  end
end
