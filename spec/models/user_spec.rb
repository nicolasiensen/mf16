require 'rails_helper'

RSpec.describe User, type: :model do
  describe ".subscribe_to_mailchimp_list" do
    it "should update the mailchimp_id" do
      VCR.use_cassette("retrieve_and_subscribe_member_from_mailchimp_list", match_requests_on: [:method]) do
        user = create(:user)
        User.subscribe_to_mailchimp_list(user.id)
        expect(user.reload.mailchimp_id).to_not be(nil)
      end
    end
  end
end
