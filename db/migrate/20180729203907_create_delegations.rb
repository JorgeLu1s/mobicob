class CreateDelegations < ActiveRecord::Migration[5.2]
  def change
    create_table :delegations do |t|
      t.integer :code
      t.string :name

      t.timestamps
    end
  end
end
