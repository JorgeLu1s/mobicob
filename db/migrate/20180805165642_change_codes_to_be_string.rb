class ChangeCodesToBeString < ActiveRecord::Migration[5.2]
  def change
    change_column :contractors, :code, :string
    change_column :delegations, :code, :string
    change_column :management_types, :code, :string
    change_column :result_types, :code, :string
    change_column :anomaly_types, :code, :string
    change_column :roles, :code, :string
  end
end
