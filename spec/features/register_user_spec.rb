require "spec_helper"

feature 'Register User' do
  let!(:user) {User.new(name: "Marvin", email: "marvki@gmail.com", password_digest: "abcd") }

  scenario "With valid input" do
    visit users_path
  end
end