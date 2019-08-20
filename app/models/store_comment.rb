class StoreComment < ApplicationRecord
  belongs_to :store
  belongs_to :log
end
