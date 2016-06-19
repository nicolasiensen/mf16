require 'rails_helper'

RSpec.describe User, type: :model do
  describe ".subscribe_to_mailchimp_list" do
    it "should update the mailchimp_id" do
      VCR.use_cassette("subscribe_to_mailchimp_list") do
        user = create(:user)
        User.subscribe_to_mailchimp_list(user.id)
        expect(user.reload.mailchimp_id).to_not be(nil)
      end
    end
  end
end
