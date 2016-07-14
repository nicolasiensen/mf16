require 'rails_helper'

RSpec.feature "ChangeMyFacebookPictures", type: :feature do
  before do
    password = "123456"
    @user = create(:user, password: password)
    login @user, password
  end

  it "should redirect the user back to his profile page" do
    VCR.use_cassette("get_user_permissions_from_facebook") do
      VCR.use_cassette("upload_facebook_image") do
        expect(current_path).to be_eql("/users/edit")
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
