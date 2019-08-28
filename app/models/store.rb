class Store < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :logs
  has_many :cupons
  has_many :store_comments

  validates :name,presence: true
  validates :url,presence: true, format: /\A#{URI::regexp(%w(http https))}\z/
  validates :kind,presence: true
  validates :profile,presence: true, 
                    length: { minimum: 20 } 

end