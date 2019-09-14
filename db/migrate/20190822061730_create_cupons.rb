class CreateCoupons < ActiveRecord::Migration[5.2]
  def change
    create_table :coupons do |t|
      t.references :store
      t.text :reason
      t.string :product
      t.string :discount
      t.string :writing
      t.integer :limit
      t.timestamps
    end
  end
end
