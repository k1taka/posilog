class RenameTypeColumnToLogs < ActiveRecord::Migration[5.2]
  def change
    rename_column :logs, :type, :kind
  end
end