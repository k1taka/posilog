class AddScoresToLogs < ActiveRecord::Migration[5.2]
  def change
    add_column :logs, :good_score, :integer
    add_column :logs, :chance_score, :integer
  end
end