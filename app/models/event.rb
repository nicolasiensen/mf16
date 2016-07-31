class Event < ActiveRecord::Base
  belongs_to :organizer, class_name: "User"
  validates :title, :start_at, presence: true
end
