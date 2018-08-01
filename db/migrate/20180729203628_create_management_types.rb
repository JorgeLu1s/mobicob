class CreateManagementTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :management_types do |t|
      t.integer :code
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
