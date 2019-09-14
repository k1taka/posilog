class RenameCoupontoCoupon < ActiveRecord::Migration[5.2]
  def change
    rename_table :coupons, :coupons #誤ったテーブル名の修正
  end
end
