class AddDetailsToStores < ActiveRecord::Migration[5.2]
  def change
    add_column :stores, :name, :string ,null: false
    add_column :stores, :url, :string ,null: false
    add_column :stores, :kind, :string ,null: false
    add_column :stores, :profile, :text
  end
end