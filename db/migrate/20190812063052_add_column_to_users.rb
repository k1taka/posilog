class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :image, :string
    add_column :users, :profile, :text
    add_column :users, :point, :integer,default:0
  end
end
