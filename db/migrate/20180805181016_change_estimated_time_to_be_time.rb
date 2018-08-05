class ChangeEstimatedTimeToBeTime < ActiveRecord::Migration[5.2]
  def change
    remove_column :assignments, :stimated_time
    add_column :assignments, :estimated_time, :time
  end
end
