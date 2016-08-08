require 'rails_helper'

RSpec.feature "SignUpAsVolunteer", type: :feature do
  context "when the form is correct" do
    before do
      visit new_volunteer_path
      fill_in "user[first_name]", with: "Jorge"
      fill_in "user[last_name]", with: "Ben"
      fill_in "user[email]", with: "jorge@mf16.com"
      click_on "Tô dentro!"
    end

    it "should create a new user" do
      expect(User.count).to be_eql(1)
    end

    it "should redirect back to the new volunteer page" do
      expect(current_path).to be_eql(new_volunteer_path)
    end

    it "should not display the form" do
      expect(page).to_not have_css('form#new_user')
    end

    it "should display a success message" do
      expect(page).to have_content("Obrigado por se juntar a essa campanha!")
    end

    it "should send an email to the new user" do
      expect(ActionMailer::Base.deliveries.count).to eql(1)
    end

    context "when the user already exists" do
      before do
        visit new_volunteer_path
        fill_in "user[first_name]", with: "Jorge"
        fill_in "user[last_name]", with: "Benjamin"
        fill_in "user[email]", with: "jorge@mf16.com"
        click_on "Tô dentro!"
      end

      it "should redirect back to the new volunteer page" do
        expect(current_path).to be_eql(new_volunteer_path)
      end

      it "should update the existing user" do
        expect(User.find_by(email: "jorge@mf16.com").last_name).to be_eql("Benjamin")
      end
    end

    context "when the user completes his profile" do
      before do
        check "user_favorite_tasks_divulgar_materiais_da_campanha"
        select "Instituto Isabel", from: "user[school]"
        check "user_favorite_topics_mulheres"
        click_on "Enviar!"
      end

      it "should update the user" do
        user = User.find_by(email: "jorge@mf16.com")
        expect(user.favorite_tasks).to include("Divulgar materiais da campanha")
        expect(user.favorite_topics).to include("Mulheres")
        expect(user.school).to be_eql("Instituto Isabel")
      end

      it "should show the thanks message" do
        expect(page).to have_content("Seu perfil foi atualizado!")
      end
    end
  end

  context "when the form is not correct" do
    before do
      visit new_volunteer_path
      check "user[wants_to_receive_tasks_via_whatsapp]"
      click_on "Tô dentro!"
    end

    it "should display form errors" do
      expect(page).to have_css(".first_name_errors", text: "não pode ficar em branco")
      expect(page).to have_css(".last_name_errors", text: "não pode ficar em branco")
      expect(page).to have_css(".email_errors", text: "não pode ficar em branco")
      expect(page).to have_css(".cell_phone_number_errors", text: "não pode ficar em branco")
    end
  end
end
