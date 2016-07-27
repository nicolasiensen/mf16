require 'rails_helper'

RSpec.feature "SignUpAsVolunteer", type: :feature do
  context "when the form is correct" do
    before do
      visit new_volunteers_path
      fill_in "user[first_name]", with: "Jorge"
      fill_in "user[last_name]", with: "Ben"
      fill_in "user[email]", with: "jorge@mf16.com"
      click_on "Quero participar"
    end

    it "should create a new user" do
      expect(User.count).to be_eql(1)
    end

    it "should redirect back to the new volunteer page" do
      expect(current_path).to be_eql(new_volunteers_path)
    end
  end

  context "when the form is not correct" do
    before do
      visit new_volunteers_path
      click_on "Quero participar"
    end

    it "should display form errors" do
      expect(page).to have_css(".first_name_errors", text: "não pode ficar em branco")
      expect(page).to have_css(".last_name_errors", text: "não pode ficar em branco")
      expect(page).to have_css(".email_errors", text: "não pode ficar em branco")
    end
  end
end
