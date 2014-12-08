class Message < ActiveRecord::Base
  validates :title, presence: true
end