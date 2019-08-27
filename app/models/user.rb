class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :image, ImageUploader
  has_many :logs
  has_many :comments

  validates :nickname,presence: true,
                    length: { maximum: 10 } 
  validates :profile,presence: true, 
                    length: { minimum: 10 } 
  
  validates :image,presence: true       
end

