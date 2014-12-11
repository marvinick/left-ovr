require "spec_helper"

feature 'Register User' do
  let!(:user) {User.new(name: "Marvin", email: "marvki@gmail.com", password_digest: "abcd") }

  scenario "With valid input" do
    visit users_path
    click_link "Add User"
    visit new_user_path
    fill_in "Name", with: user.name
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password_digest
    click_button "Okay"
    expect(page).to have_content ''
  end

  scenario "With invalid input" do
    visit users_path
    click_link "Add User"
    visit new_user_path
    fill_in "Name", with: user.name
    fill_in "Password", with: user.password_digest
    click_button "Okay"
    expect(page).to have_content ''
  end
end