class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|
      t.date :due_date
      t.date :stimated_time
      t.date :management_date
      t.string :collection_entity
      t.date :payment_date
      t.date :commitment_date
      t.boolean :personal_contact
      t.integer :id_number
      t.string :payment_holder
      t.string :phone
      t.string :email
      t.string :observations
      t.integer :reading_signature
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
