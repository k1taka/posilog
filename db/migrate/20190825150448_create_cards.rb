class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.integer :store_id, null: false
      t.string :customer_id, null: false
      t.string :card_id, null: false
      t.integer :fee_plan, default: 0
      t.timestamps
    end
  end
end
