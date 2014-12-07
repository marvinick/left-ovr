require 'spec_helper'

feature "User creates message" do
  let!(:message) { Message.new(title: "Extra rice", content:"We have rice") }

  scenario "with valid input" do
    visit messages_path
    click_link "New Message"
    visit new_message_path
    fill_in "Title", with: message.title
    fill_in "Content", with: message.content
    click_button "Submit"
    expect(page).to have_content ''
  end
end