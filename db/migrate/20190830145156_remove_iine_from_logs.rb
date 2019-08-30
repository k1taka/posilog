class RemoveIineFromLogs < ActiveRecord::Migration[5.2]
  def change
    remove_column :logs, :iine, :integer
  end
end
