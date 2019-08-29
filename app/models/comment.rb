class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :log

  validates :text,presence: true

end