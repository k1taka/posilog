class Cupon < ApplicationRecord
  enum status: { open: 0, closed: 1 }
  mount_uploader :image, ImageUploader

  belongs_to :store
end
