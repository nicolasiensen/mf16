class AddDistrictToUser < ActiveRecord::Migration
  def change
    add_column :users, :district, :string
  end
end
