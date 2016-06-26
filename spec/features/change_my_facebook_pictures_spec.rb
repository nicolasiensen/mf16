require 'rails_helper'

RSpec.feature "ChangeMyFacebookPictures", type: :feature do
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

  it "should redirect the user back to his profile page" do
    VCR.use_cassette("get_user_permissions_from_facebook") do
      VCR.use_cassette("upload_facebook_image") do
        click_on "Trocar minha foto do Facebook"
        expect(current_path).to be_eql("/users/edit")
      end
    end
  end

  it "should display his foto with badge" do
    VCR.use_cassette("get_user_permissions_from_facebook") do
      VCR.use_cassette("upload_facebook_image") do
        click_on "Trocar minha foto do Facebook"
        expect(page).to have_css("#user-photo-with-badge")
      end
    end
  end
end
