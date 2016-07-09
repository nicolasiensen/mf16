require 'rails_helper'

RSpec.feature "MakeAnUserAdmin", type: :feature do
  before do
    @user = create(:user)
    password = "123456"
    admin = create(:user, admin: true, password: password)
    login admin, password
    visit user_path(@user)

    click_on "Tornar admin"
  end

  it "should make an user admin" do
    expect(@user.reload).to be_admin
  end

  it "should disable the make admin button" do
    expect(page).to have_css("span.is-disabled", text: "Tornar admin")
  end
end
