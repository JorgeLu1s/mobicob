ActiveAdmin.register Role do
  permit_params %i[id code name description]

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

  show do |role|
    attributes_table do
      rows :id, :code, :name, :description, :created_at, :updated_at
      row :users do
          role.users.map{ |user| link_to(user.email, admin_user_path(user)) }.join(", ").html_safe
      end
    end
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :code
      f.input :name
      f.input :description
    end
    f.actions
  end

end