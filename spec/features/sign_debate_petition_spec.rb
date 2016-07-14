require 'rails_helper'

RSpec.feature "SignDebatePetition", type: :feature do
  context "when the form is valid" do
    before do
      visit new_debate_petition_signatures_path
      fill_in "user[first_name]", with: "Jorge"
      fill_in "user[last_name]", with: "Ben"
      fill_in "user[email]", with: "jorge@mf16.com"
      fill_in "user[cell_phone_number]", with: "21 988887777"
      select "Barra da Tijuca", from: "user[district]"
      click_on "Assinar!"
    end

    it "should create a new user" do
      expect(User.where(email: "jorge@mf16.com")).to_not be_empty
    end

    it "should create a user with the debate petition signature" do
      expect(User.find_by(email: "jorge@mf16.com")).to have_signed_debate_petition
    end
  end

  context "when the form is invalid" do
    before do
      visit new_debate_petition_signatures_path
      click_on "Assinar!"
    end

    it "should display the form errors" do
      expect(page).to have_css(".first_name_errors", text: "não pode ficar em branco")
      expect(page).to have_css(".last_name_errors", text: "não pode ficar em branco")
      expect(page).to have_css(".email_errors", text: "não pode ficar em branco")
    end
  end
end
