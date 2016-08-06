class AddThemeToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :theme, :string
  end
end
