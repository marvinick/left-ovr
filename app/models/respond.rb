class Respond < ActiveRecord::Base
  belongs_to :message
  validates :name, presence: true
  validates :body, presence: true
end