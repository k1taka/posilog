class Log < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :comments
  belongs_to :store
  has_many :log_images,dependent: :destroy
  accepts_nested_attributes_for :log_images, allow_destroy: true

end
