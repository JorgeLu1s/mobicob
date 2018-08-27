class AddRelationshipBetweenTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :anomaly_types, :result_type_id, :integer
    add_column :result_types, :management_type_id, :integer
  end
end
