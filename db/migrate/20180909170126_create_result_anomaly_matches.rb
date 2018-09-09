class CreateResultAnomalyMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :result_anomaly_matches do |t|
      t.references :result_type, index: true, foreign_key: true
      t.references :anomaly_type, index: true, foreign_key: true
      t.timestamps
    end
    remove_column :anomaly_types, :result_type_id, :integer
  end
end
