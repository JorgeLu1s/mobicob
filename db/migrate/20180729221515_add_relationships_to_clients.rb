class AddRelationshipsToClients < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :delegation_id, :integer
  end
end
