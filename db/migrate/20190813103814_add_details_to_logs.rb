class AddDetailsToLogs < ActiveRecord::Migration[5.2]
  def change
    add_reference :logs, :store, foreign_key:true
  end
end
