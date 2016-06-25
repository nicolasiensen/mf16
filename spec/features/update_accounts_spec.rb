require 'rails_helper'

RSpec.feature "UpdateAccount", type: :feature do
  before do
    password = "123456"
    @user = create(:user, password: password)

    visit "/users/sign_in"

    within("#new_user") do
      fill_in "user[email]", with: @user.email
      fill_in "user[password]", with: password
      click_on "Entrar"
    end
  end

  context "when the update account form is correct" do
    before do
      @new_data = {
        email: "mrblacc@mf16.com",
        first_name: "Aloe",
        last_name: "Blacc",
        district: "Laguna Hills",
        cell_phone_number: "9999999999"
      }

      fill_in "user[email]", with: @new_data[:email]
      fill_in "user[first_name]", with: @new_data[:first_name]
      fill_in "user[last_name]", with: @new_data[:last_name]
      fill_in "user[district]", with: @new_data[:district]
      fill_in "user[cell_phone_number]", with: @new_data[:cell_phone_number]
      click_on "Atualizar"
    end

    it "should redirect to the profile edit page" do
      expect(current_path).to eql('/users')
    end

    it "should update the user data" do
      expect(find_field('user[email]').value).to eql(@new_data[:email])
      expect(find_field('user[first_name]').value).to eql(@new_data[:first_name])
      expect(find_field('user[last_name]').value).to eql(@new_data[:last_name])
      expect(find_field('user[district]').value).to eql(@new_data[:district])
      expect(find_field('user[cell_phone_number]').value).to eql(@new_data[:cell_phone_number])
    end
  end

  context "when the update account form is not correct" do
    before do
      fill_in "user[first_name]", with: ''
      fill_in "user[last_name]", with: ''
      fill_in "user[email]", with: ''
      click_on "Atualizar"
    end

    it 'should display errors' do
      expect(page).to have_css(".first_name_errors", text: "não pode ficar em branco")
      expect(page).to have_css(".last_name_errors", text: "não pode ficar em branco")
      expect(page).to have_css(".email_errors", text: "não pode ficar em branco")
    end
  end
end
