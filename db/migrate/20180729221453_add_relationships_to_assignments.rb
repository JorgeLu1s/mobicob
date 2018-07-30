class AddRelationshipsToAssignments < ActiveRecord::Migration[5.2]
  def change
    add_column :assignments, :task_id, :integer
    add_column :assignments, :user_id, :integer
    add_column :assignments, :management_type_id, :integer
    add_column :assignments, :result_type_id, :integer
    add_column :assignments, :anomaly_type_id, :integer
  end
end
