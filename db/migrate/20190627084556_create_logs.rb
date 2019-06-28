class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.string :title,              null: false
      t.text :good,              null: false
      t.text :chance,              null: false
      t.string :iine,              null: false, default: "0"
      t.string :type,              null: false
      t.string :image
      t.timestamps null: false
    end
  end
end