require 'rails_helper'

RSpec.feature "SearchUser", type: :feature, js: true do
  context "when it's logged in" do
    before do
      password = "123456"
      @user = create(:user, password: password, admin: true)
      login @user, password
    end

    it "should display the users that match the email" do
      user = create(:user)

      click_on "Procurar usuário"
      fill_in "search_query", with: user.email
      find("input[name='search_query']").send_keys([:enter])

      expect(page).to have_text("1 usuário foi encontrado")
      expect(page).to have_text(user.first_name)
      expect(page).to have_text(user.last_name)
      expect(page).to have_text(user.email)
    end
  end

  it "should not allow non admin users" do
    visit '/users/search'
    expect(current_path).to_not be_eql('/users/search')
    expect(page).to have_css('#alert-message')
  end
end
