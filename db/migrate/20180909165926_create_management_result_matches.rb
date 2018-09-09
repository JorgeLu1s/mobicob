class CreateManagementResultMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :management_result_matches do |t|
      t.references :management_type, index: true, foreign_key: true
      t.references :result_type, index: true, foreign_key: true
      t.timestamps
    end
    remove_column :result_types, :management_type_id, :integer
  end
end
