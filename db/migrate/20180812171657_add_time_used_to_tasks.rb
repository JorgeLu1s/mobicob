class AddTimeUsedToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :used_time, :time
  end
end
