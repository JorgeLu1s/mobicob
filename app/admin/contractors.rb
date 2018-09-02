ActiveAdmin.register Contractor do

  permit_params %i[id code name]

  menu priority: 6

  filter :code
  filter :name

  controller do
    def action_methods
      if current_user != nil &&
        (current_user.role.code == '4' || current_user.role.code == '3')
        ['index', 'show']
      else
        super
      end
    end
  end

  index do
    selectable_column
    id_column
    column :code
    column :name
    column :created_at
    actions
  end

  show do |contractor|
    attributes_table do
      rows :id, :code, :name, :created_at, :updated_at
      row :users do
          contractor.users.map{ |user| link_to(user.email, admin_user_path(user)) }.join(", ").html_safe
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
