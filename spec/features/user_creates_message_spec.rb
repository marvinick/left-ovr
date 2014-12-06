require 'spec_helper'

feature "User creates message" do
  let!(:message) { Message.new(title: "Extra rice", content:"We have rice") }

  scenario "with valid input" do
    visit messages_path
    click_link "New Message"
  end
end