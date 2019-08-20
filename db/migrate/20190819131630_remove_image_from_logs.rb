class RemoveImageFromLogs < ActiveRecord::Migration[5.2]
  def change
    remove_column :logs, :image, :string
  end
end
