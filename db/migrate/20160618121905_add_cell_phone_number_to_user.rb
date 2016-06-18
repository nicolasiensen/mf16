class AddCellPhoneNumberToUser < ActiveRecord::Migration
  def change
    add_column :users, :cell_phone_number, :string
  end
end
