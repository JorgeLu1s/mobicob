ActiveAdmin.register Task do
  permit_params %i[id period plan validity campaign_id client_id collection_entity
    commitment_date due_date email id_number latitude longitude management_date
    observations payment_date payment_holder personal_contact phone
    reading_signature estimated_time anomaly_type_id management_type_id
    result_type_id user_id dataphone_payment]

  menu priority: 3

  controller do
    
  end

  filter :period
  filter :campaign
  filter :client
  filter :user
  filter :result_type
  filter :management_type_id
  filter :anomaly_type_id

  index do
    selectable_column
    id_column
    column :period
    column :campaign
    column :client
    column :user
    column :due_date
    column :created_at
    column :management_date
    actions
  end

  show do |task|
    attributes_table do
      rows :id, :period, :plan, :validity, :campaign, :client, :created_at,
      :updated_at, :user, :due_date
      row :estimated_time do
        task.estimated_time.strftime('%H:%M')
      end
      rows :management_date,
        :management_type, :result_type, :anomaly_type, :collection_entity,
        :payment_date, :commitment_date, :personal_contact, :id_number,
        :payment_holder, :phone, :email, :observations, :reading_signature,
        :dataphone_payment, :latitude, :longitude
    end
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :period
      f.input :plan
      f.input :validity, as: :select,
        collection: Task.validities.keys.map{ |item| [item.titleize, item] }
      f.input :campaign
      f.input :client
      f.input :user
      f.input :due_date
      f.input :estimated_time
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
        f.input :dataphone_payment
        f.input :latitude
        f.input :longitude
      end
    end
    f.actions
  end

end
