require 'rails_helper'

RSpec.feature "UpdateAccount", type: :feature do
  before do
    @password = "123456"
    @user = create(:user, password: @password)
    login @user, @password
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

      within("#edit_user") do
        fill_in "user[email]", with: @new_data[:email]
        fill_in "user[first_name]", with: @new_data[:first_name]
        fill_in "user[last_name]", with: @new_data[:last_name]
        fill_in "user[district]", with: @new_data[:district]
        fill_in "user[cell_phone_number]", with: @new_data[:cell_phone_number]
        fill_in "user[current_password]", with: @password
        click_on "Atualizar"
      end
    end

    it "should redirect to the profile edit page" do
      expect(current_path).to eql('/')
    end

    it "should display a successful message" do
      expect(page).to have_css('#notice-message')
    end

    it "should update the user data" do
      expect(@user.reload.email).to eql(@new_data[:email])
      expect(@user.reload.first_name).to eql(@new_data[:first_name])
      expect(@user.reload.last_name).to eql(@new_data[:last_name])
      expect(@user.reload.district).to eql(@new_data[:district])
      expect(@user.reload.cell_phone_number).to eql(@new_data[:cell_phone_number])
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
