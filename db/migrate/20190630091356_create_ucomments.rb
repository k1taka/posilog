class CreateUcomments < ActiveRecord::Migration[5.2]
  def change
    create_table :ucomments do |t|
      t.integer :user_id
      t.integer :log_id
      t.text :text
      t.timestamps
    end
  end
end
