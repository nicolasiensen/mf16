require 'rails_helper'

RSpec.feature "ToggleLivestreams", type: :feature do
  context "when the user enable it" do
    before do
      password = "123456"
      @user = create(:user, password: password, admin: true)
      login @user, password

      visit edit_settings_path
      fill_in "livestream_embed", with: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/4zgHzJPZUZw\" frameborder=\"0\" allowfullscreen></iframe>"
      click_on "Salvar"
    end

    it "should redirect to the edit settings page" do
      expect(current_path).to be_eql(edit_settings_path)
    end

    it "should display the live button" do
      expect(page).to have_css("#livestream-button")
    end
  end

  context "when the user is not admin" do
    before do
      visit edit_settings_path
    end

    it "should not allow the user to visit the edit settings page" do
      expect(current_path).to_not be_eql(edit_settings_path)
    end
  end
end
