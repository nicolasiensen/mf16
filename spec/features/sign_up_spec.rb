require 'rails_helper'

RSpec.feature "SignUp", type: :feature do
  context "when the sign up form is correct" do
    before do
      visit "/users/sign_up"
      fill_in "user[first_name]", with: "Nícolas"
      fill_in "user[last_name]", with: "Iensen"
      fill_in "user[email]", with: "nicolas@mf16.com"
      fill_in "user[password]", with: "123456"
      fill_in "user[password_confirmation]", with: "123456"
      click_on "Cadastrar"
    end

    it "should redirect to profile page" do
      expect(current_path).to eql(edit_user_registration_path)
    end

    it "should create a new user" do
      expect(User.count).to eql(1)
    end

    it "should send an email to the new user" do
      expect(ActionMailer::Base.deliveries.count).to eql(1)
    end
  end

  context "when the sign up form is not correct" do
    it "should display errors" do
      visit "/users/sign_up"
      click_on "Cadastrar"

      expect(page).to have_css(".first_name_errors", text: "não pode ficar em branco")
      expect(page).to have_css(".last_name_errors", text: "não pode ficar em branco")
      expect(page).to have_css(".email_errors", text: "não pode ficar em branco")
      expect(page).to have_css(".password_errors", text: "não pode ficar em branco")
    end
  end
end
