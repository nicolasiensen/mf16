class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :category
      t.text :short_description
      t.text :long_description
      t.string :address
      t.datetime :start_at
      t.string :facebook_link
      t.string :google_calendar_link
      t.boolean :has_streaming
      t.integer :organizer_id

      t.timestamps null: false
    end
  end
end
