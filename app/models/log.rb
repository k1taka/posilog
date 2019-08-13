class Log < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :comments
  belongs_to :store

end
