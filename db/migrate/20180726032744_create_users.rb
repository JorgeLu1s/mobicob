class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password
      t.string :name
      t.string :lastname
      t.date :creation
      t.integer :id_number
      t.integer :delegation_id
      t.integer :contractor_id
      t.string :phone
      t.string :address
      t.boolean :active
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
