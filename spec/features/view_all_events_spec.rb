require 'rails_helper'

RSpec.feature "ViewAllEvents", type: :feature do
  before do
    @event = create(:event)
    password = "123456"
    @user = create(:user, password: password, admin: true)
    login @user, password
    visit events_path
  end

  it "should display all events" do
    expect(page).to have_content(@event.title)
  end
end
