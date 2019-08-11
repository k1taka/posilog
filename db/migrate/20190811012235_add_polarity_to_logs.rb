class AddPolarityToLogs < ActiveRecord::Migration[5.2]
  def change
    add_column :logs, :polarity, :float,default: 0
  end
end