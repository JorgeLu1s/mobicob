ActiveAdmin.register Delegation do
permit_params %i[id code name]

  menu priority: 7

  filter :code
  filter :name

  controller do
    helper_method :allowed_roles

    def allowed_roles
      allowed_roles = Role.basic_roles.dup
      allowed_roles.delete(:web)
      allowed_roles.delete(:mobile)
      return allowed_roles
    end

    def action_methods
      if current_user != nil && allowed_roles.values.include?(current_user.role.code)
        super
      else
        ['index', 'show']
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
