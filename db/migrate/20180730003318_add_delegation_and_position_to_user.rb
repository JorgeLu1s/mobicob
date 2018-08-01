class AddDelegationAndPositionToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :delegation_id, :integer
    add_column :users, :position, :string
  end
end
