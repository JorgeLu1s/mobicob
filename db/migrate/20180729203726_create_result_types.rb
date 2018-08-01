class CreateResultTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :result_types do |t|
      t.integer :code
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
