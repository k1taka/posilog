class AddDetailsToCopons < ActiveRecord::Migration[5.2]
  def change
    add_column :cupons, :status, :integer, default: 0   
    add_column :cupons, :image, :string
  end
end
