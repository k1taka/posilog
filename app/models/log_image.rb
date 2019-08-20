class LogImage < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :log
end
