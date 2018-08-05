ActiveAdmin.register Assignment do
  permit_params %i[ id collection_entity commitment_date due_date 
    email id_number latitude longitude management_date observations 
    payment_date payment_holder personal_contact phone reading_signature 
    stimated_time anomaly_type_id management_type_id result_type_id 
    task_id user_id ]

  controller do
    
  end

  filter :task
  filter :user
  filter :result_type
  filter :management_type_id
  filter :anomaly_type_id

  index do
    selectable_column
    id_column
    column :task
    column :user
    column :due_date
    column :stimated_time
    column :created_at
    column :management_date
    actions
  end

  show do |assignment|
    attributes_table do
      rows :id, :collection_entity, :commitment_date, :due_date, 
          :email, :id_number, :latitude, :longitude, :management_date, 
          :observations, :payment_date, :payment_holder, :personal_contact, 
          :phone, :reading_signature, :stimated_time, :anomaly_type, 
          :management_type, :result_type, :task, :user
    end
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :task
      f.input :user
      f.input :due_date
      f.input :stimated_time
      unless f.object.new_record?
        f.input :management_date
        f.input :management_type
        f.input :result_type
        f.input :anomaly_type
        f.input :collection_entity
        f.input :payment_date
        f.input :commitment_date
        f.input :personal_contact
        f.input :id_number
        f.input :payment_holder
        f.input :phone
        f.input :email
        f.input :observations
        f.input :reading_signature
        f.input :latitude
        f.input :longitude
      end
    end
    f.actions
  end

end
