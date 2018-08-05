ActiveAdmin.register Client do
  permit_params %i[ id AOL CGV NIC NIS address agreed_bills 
    corregimiento dataphone_payment departament duplicator 
    energy_debt financed_debt id_number irregular_debt measurer 
    measurer_brand measurer_type municipality name neighborhood 
    number overdue_bills phone rate reading_itinerary route state 
    street_name street_type third_party_debt unicom created_at 
    updated_at delegation_id ]

  menu priority: 5

  controller do
    
  end

  filter :NIC
  filter :state
  filter :delegation
  filter :departament
  filter :municipality
  filter :neighborhood

  index do
    selectable_column
    id_column
    column :NIC
    column :unicom
    column :delegation
    column :NIS
    column :departament
    column :municipality
    column :address
    column :phone
    column :name
    column :state
    actions
  end

  show do |client|
    attributes_table do
      rows :NIC, :unicom, :delegation, :NIS, :departament, 
      :municipality, :corregimiento, :neighborhood, :street_type, 
      :street_name, :duplicator, :number, :CGV, :address, :name, 
      :id_number, :phone, :rate, :state, :route, :reading_itinerary, 
      :AOL, :measurer, :measurer_type, :measurer_brand, :energy_debt, 
      :irregular_debt, :third_party_debt, :financed_debt, 
      :overdue_bills, :agreed_bills, :dataphone_payment, :created_at,
      :updated_at
      row :tasks do
          client.tasks.map{ |task| link_to(task.id, 
            admin_task_path(task)) }.join(", ").html_safe
      end
    end
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :NIC
      f.input :unicom
      f.input :delegation
      f.input :NIS
      f.input :departament
      f.input :municipality
      f.input :corregimiento
      f.input :neighborhood
      f.input :street_type
      f.input :street_name
      f.input :duplicator
      f.input :number
      f.input :CGV
      f.input :address
      f.input :name
      f.input :id_number
      f.input :phone
      f.input :rate
      f.input :state
      f.input :route
      f.input :reading_itinerary
      f.input :AOL
      f.input :measurer
      f.input :measurer_type
      f.input :measurer_brand
      f.input :energy_debt
      f.input :irregular_debt
      f.input :third_party_debt
      f.input :financed_debt
      f.input :overdue_bills
      f.input :agreed_bills
      f.input :dataphone_payment
    end
    f.actions
  end

end
