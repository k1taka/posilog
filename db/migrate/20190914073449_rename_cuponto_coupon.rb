class RenameCupontoCoupon < ActiveRecord::Migration[5.2]
  def change
    rename_table :cupons, :coupons #誤ったテーブル名の修正
  end
end
