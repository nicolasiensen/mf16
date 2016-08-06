require 'rails_helper'

RSpec.feature "ViewAGroupPages", type: :feature do
  context "when the user is not logged in" do
    before do
      @group = create(:group)
      visit group_path(@group)
    end

    it "should display the group name" do
      expect(page).to have_content(@group.name)
    end

    it "should not display the edit group button" do
      expect(page).to_not have_link("Editar núcleo")
    end
  end

  context "when the user is logged in as admin" do
    before do
      password = "123456"
      user = create(:user, admin: true, password: password)
      login(user, password)

      @group = create(:group)
      visit group_path(@group)
    end

    it "should display the edit group button" do
      expect(page).to have_link("Editar núcleo")
    end
  end
end
