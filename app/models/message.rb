class Message < ActiveRecord::Base
  validates :title, presence: true
  validates :content, presence: true
  has_many :responds

  belongs_to :gallery
  mount_uploader :image, ImageUploader
end