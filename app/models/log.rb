class Log < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :comments
  has_many :store_comments
  belongs_to :store
  has_many :log_images,dependent: :destroy
  accepts_nested_attributes_for :log_images, allow_destroy: true
  
  validates :title,presence: true
  validates :store_id,presence: true
  validates :kind,presence: true
  validates :good,presence: true,length: { minimum: 20 }
  validates :chance,presence: true,length: { minimum: 20 }
  validates :good_score,presence: true,numericality:{greater_than_or_equal_to: 50}
  validates :chance_score,presence: true,numericality:{greater_than_or_equal_to: 50}

end
