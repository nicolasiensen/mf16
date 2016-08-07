require 'rails_helper'

RSpec.feature "SubscribeToAGroups", type: :feature do
  context "when the form is valid" do
    before do
      @group = create(:group)
      visit group_path(@group)
      fill_in "group_subscription[email]", with: "nicolas@mf16.com"
      fill_in "group_subscription[phone]", with: "(21) 99999 9999"
      click_on "Inscrever-se"
    end

    it "should redirect to the group page" do
      expect(current_path).to be_eql(group_path(@group))
    end

    it "should create a new group subscription" do
      expect(@group.group_subscriptions).to_not be_empty
    end

    it "should show a thank you message in place of the form" do
      expect(page).to have_css(".thanks_for_subscribing")
      expect(page).to_not have_css("#new_group_subscription")
    end
  end

  context "when the form is not valid" do
    before do
      @group = create(:group)
      visit group_path(@group)
      click_on "Inscrever-se"
    end

    it "should not create a new group subscription" do
      expect(@group.group_subscriptions).to be_empty
    end

    it "should show the errors" do
      expect(page).to have_css(".email_errors", text: "não pode ficar em branco")
      expect(page).to have_css(".phone_errors", text: "não pode ficar em branco")
    end
  end
end
