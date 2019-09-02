class LogImage < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :log

  validates :image,presence: true,on: :create

end