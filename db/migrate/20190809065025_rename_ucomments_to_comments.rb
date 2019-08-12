class RenameUcommentsToComments < ActiveRecord::Migration[5.2]
  def change
    rename_table :ucomments, :comments
  end
end