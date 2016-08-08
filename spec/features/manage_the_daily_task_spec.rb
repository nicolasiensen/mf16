require 'rails_helper'

RSpec.feature "ManageTheDailyTask", type: :feature do
  context "when the user submit a new task" do
    before do
      password = "123456"
      @user = create(:user, password: password, admin: true)
      login @user, password

      visit edit_settings_path
      fill_in "daily_task_description", with: "This is the new task"
      fill_in "daily_task_link", with: "http://www.marcelofreixo.com.br/"
      click_on "Salvar"
    end

    it "should redirect back to the edit settings page" do
      expect(current_path).to be_eql(edit_settings_path)
    end

    it "should update the daily task description" do
      expect(Setting.daily_task_description).to be_eql("This is the new task")
    end

    it "should update the daily task link" do
      expect(Setting.daily_task_link).to be_eql("http://www.marcelofreixo.com.br/")
    end

    it "should set the daily task visible" do
      visit new_volunteer_path
      expect(page).to have_content("This is the new task")
      expect(page).to have_link("Participar", href: "http://www.marcelofreixo.com.br/")
    end
  end

  context "when the user disable the daily task" do
    before do
      password = "123456"
      @user = create(:user, password: password, admin: true)
      login @user, password

      visit edit_settings_path
      fill_in "daily_task_description", with: ""
      fill_in "daily_task_link", with: ""
      click_on "Salvar"
    end

    it "should set the daily task invisible" do
      visit new_volunteer_path
      expect(page).to_not have_css("#daily-task")
    end
  end
end
