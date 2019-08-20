class CreateLogImages < ActiveRecord::Migration[5.2]
  def change
    create_table :log_images do |t|
      t.string :image
      t.integer :log_id
      t.timestamps
    end
  end
end
