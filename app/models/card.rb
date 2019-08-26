class Card < ApplicationRecord

  enum fee_plan: { free: 0, light: 1 ,premium: 2 }

end
