require 'rails_helper'

RSpec.feature "SignUps", type: :feature do
  it "should redirect to homepage and create a user" do
    visit "/users/sign_up"
    fill_in "user[first_name]", with: "Nícolas"
    fill_in "user[last_name]", with: "Iensen"
    fill_in "user[email]", with: "nicolas@mf16.com"
    fill_in "user[password]", with: "123456"
    fill_in "user[password_confirmation]", with: "123456"
    click_on "Cadastrar-se"

    expect(current_path).to eql('/')
    expect(User.count).to eql(1)
  end

  it "should display errors" do
    visit "/users/sign_up"
    click_on "Cadastrar-se"

    expect(page).to have_css(".first_name_errors", text: "não pode ficar em branco")
    expect(page).to have_css(".last_name_errors", text: "não pode ficar em branco")
    expect(page).to have_css(".email_errors", text: "não pode ficar em branco")
    expect(page).to have_css(".password_errors", text: "não pode ficar em branco")
  end
end
