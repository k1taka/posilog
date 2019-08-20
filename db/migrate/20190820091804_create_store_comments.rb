class CreateStoreComments < ActiveRecord::Migration[5.2]
  def change
    create_table :store_comments do |t|
      t.text :text
      t.references :log
      t.references :store

      t.timestamps
    end
  end
end
