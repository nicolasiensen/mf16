require 'rails_helper'

RSpec.feature "CreateAnEvent", type: :feature do
  before do
    password = "123456"
    @user = create(:user, password: password, admin: true)
    login @user, password
  end

  context "when the form is correct" do
    before do
      visit events_path
      click_on "Novo evento"
      @event_organizer = create(:user)

      fill_in "event[title]", with: "Meu evento"
      select "Comício", from: "event[category]"
      fill_in "event[short_description]", with: "Esse comício vai estrondar!"
      fill_in "event[long_description]", with: "A política nunca mais será a mesma depois desse comício"
      fill_in "event[address]", with: "Rua Mena Barreto, 161"
      select "16", from: "event[start_at(4i)]"
      select "20", from: "event[start_at(5i)]"
      select "6", from: "event[start_at(3i)]"
      select "Março", from: "event[start_at(2i)]"
      select "2017", from: "event[start_at(1i)]"
      fill_in "event[facebook_link]", with: "https://www.facebook.com/events/1266806543348899/"
      fill_in "event[google_calendar_link]", with: "https://www.google.com/calendar/render?action=TEMPLATE&text=Your+Event+Name&dates=20140127T224000Z/20140320T221500Z&details=For+details,+link+here:+http://www.example.com&location=Waldorf+Astoria,+301+Park+Ave+,+New+York,+NY+10022&sf=true&output=xml"
      check "event[has_streaming]"
      fill_in "organizer_email", with: @event_organizer.email

      click_on "Criar evento"
    end

    it "should create a new event" do
      expect(Event.count).to be_eql(1)
    end

    it "should attribute the right organizer to the event" do
      expect(Event.first.organizer).to be_eql(@event_organizer)
    end

    it "should redirect to the events list" do
      expect(current_path).to be_eql(events_path)
    end
  end

  context "when the form is not correct" do
    before do
      visit events_path
      click_on "Novo evento"
      click_on "Criar evento"
    end

    it "should not create a new event" do
      expect(Event.count).to be_eql(0)
    end

    it "should render the event form page" do
      expect(page).to have_css("form.new_event")
    end

    it "should display form errors" do
      expect(page).to have_css(".title_errors", text: "não pode ficar em branco")
    end
  end
end
