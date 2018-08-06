class AddAssigmentsFieldsToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :user_id, :integer
    add_column :tasks, :due_date, :date
    add_column :tasks, :estimated_time, :time
    add_column :tasks, :management_date, :date
    add_column :tasks, :management_type_id, :integer
    add_column :tasks, :result_type_id, :integer
    add_column :tasks, :anomaly_type_id, :integer
    add_column :tasks, :collection_entity, :string
    add_column :tasks, :payment_date, :date
    add_column :tasks, :commitment_date, :date
    add_column :tasks, :personal_contact, :boolean
    add_column :tasks, :id_number, :integer
    add_column :tasks, :payment_holder, :string
    add_column :tasks, :phone, :string
    add_column :tasks, :email, :string
    add_column :tasks, :observations, :string
    add_column :tasks, :reading_signature, :integer
    add_column :tasks, :latitude, :string
    add_column :tasks, :longitude, :string

    drop_table :assignments
  end
end
