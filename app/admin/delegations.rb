ActiveAdmin.register Delegation do
permit_params %i[id code name]

  controller do
    
  end

  filter :code
  filter :name

  index do
    selectable_column
    id_column
    column :code
    column :name
    column :created_at
    actions
  end

  show do |delegation|
    attributes_table do
      rows :id, :code, :name, :created_at, :updated_at
      row :users do
          delegation.users.map{ |user| link_to(user.email, admin_user_path(user)) }.join(", ").html_safe
      end
      row :clients do
          delegation.clients.map{ |client| link_to(client.NIC, admin_client_path(client)) }.join(", ").html_safe
      end
    end
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :code
      f.input :name
    end
    f.actions
  end
end
