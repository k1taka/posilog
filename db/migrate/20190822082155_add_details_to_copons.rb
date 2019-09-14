class AddDetailsToCopons < ActiveRecord::Migration[5.2]
  def change
    add_column :coupons, :status, :integer, default: 0   
    add_column :coupons, :image, :string
  end
end
