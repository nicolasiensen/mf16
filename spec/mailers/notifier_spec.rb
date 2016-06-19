require "rails_helper"

RSpec.describe Notifier, type: :mailer do
  describe ".welcome" do
    it "should send the email to the new user" do
      user = create(:user)
      email = Notifier.welcome(user)
      expect(email.to).to include(user.email)
    end
  end
end
