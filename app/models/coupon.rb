class Coupon < ApplicationRecord
  enum status: { open: 0, closed: 1 }
  mount_uploader :image, ImageUploader
  belongs_to :store
  
  validates :reason,presence: true
  validates :store_id,presence: true
  validates :product,presence: true
  validates :discount,presence: true
  validates :limit,presence: true,numericality: true

end
