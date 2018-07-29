class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.integer :NIC
      t.string :unicom
      t.integer :NIS
      t.string :departament
      t.string :municipality
      t.string :corregimiento
      t.string :neighborhood
      t.string :street_type
      t.string :street_name
      t.string :duplicator
      t.integer :number
      t.string :CGV
      t.string :address
      t.string :name
      t.integer :id_number
      t.string :phone
      t.string :rate
      t.string :state
      t.integer :route
      t.integer :reading_itinerary
      t.integer :AOL
      t.string :measurer
      t.string :measurer_type
      t.string :measurer_brand
      t.integer :energy_debt
      t.integer :irregular_debt
      t.integer :third_party_debt
      t.integer :financed_debt
      t.integer :overdue_bills
      t.integer :agreed_bills
      t.boolean :dataphone_payment

      t.timestamps
    end
  end
end
