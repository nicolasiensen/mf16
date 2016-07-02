def login user, password
  visit "/users/sign_in"

  within("#new_user") do
    fill_in "user[email]", with: user.email
    fill_in "user[password]", with: password
    click_on "Entrar"
  end
end
