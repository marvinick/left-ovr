require 'spec_helper'

feature "User creates message" do
  let!(:message) { Message.new(title: "Extra rice", link:"http://yahoo.com", content:"We have rice") }

  scenario "with valid input" do
    visit messages_path
    click_link "New"
    visit new_message_path
    fill_in "Title", with: message.title
    fill_in "Link", with: message.link
    fill_in "Content", with: message.content
    click_button "Create Message"
    expect(page).to have_content ''
  end

  scenario "with invalid input" do
    visit messages_path
    click_link "New"
    visit new_message_path
    fill_in "Content", with: message.content
    click_button "Create Message"
    expect(page).to have_content ''
  end
end