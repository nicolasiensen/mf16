require 'rails_helper'

RSpec.feature "ViewUserProfile", type: :feature do
  it "should display user information" do
    password = "123456"
    admin = create(:user, admin: true, password: password)
    user = create(:user)
    login admin, password

    visit user_path(user)

    expect(page).to have_content(user.first_name)
    expect(page).to have_content(user.last_name)
    expect(page).to have_content(user.email)
    expect(page).to have_content(user.district)
    expect(page).to have_content(user.cell_phone_number)
  end
end
