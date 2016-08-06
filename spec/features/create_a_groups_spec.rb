require 'rails_helper'

RSpec.feature "CreateAGroup", type: :feature do
  context "when the user is logged in as admin" do
    before do
      password = "123456"
      user = create(:user, admin: true, password: password)
      login(user, password)
    end

    context "when the form is valid" do
      before do
        visit new_group_path
        within("#new_group") do
          choose "Territorial"
          fill_in "group[name]", with: "Amigos de Botafogo"
          select "Botafogo", from: "group[district]"
          select "Saúde", from: "group[theme]"
          fill_in "group[address]", with: "Rua Mena Barreto, 161 - Botafogo"
          fill_in "group[email]", with: "botafogo@mf16.com"
          fill_in "group[phone]", with: "(21) 99999 9999"
          fill_in "group[facebook_page]", with: "https://www.facebook.com/MarceloFreixoPsol/?fref=ts"
          fill_in "group[facebook_group]", with: "https://www.facebook.com/groups/23019977343/"
          click_on "Criar Núcleo"
        end
      end

      it "should redirect to the new group page" do
        expect(current_path).to be_eql(group_path(Group.first))
      end
    end

    context "when the form is not valid" do
      before do
        visit new_group_path
        within("#new_group") do
          click_on "Criar Núcleo"
        end
      end

      it "should not create the new group" do
        expect(Group.count).to be_eql(0)
      end

      it "should display the errors" do
        expect(page).to have_css(".kind_errors", text: "não pode ficar em branco")
        expect(page).to have_css(".name_errors", text: "não pode ficar em branco")
      end
    end
  end
end
