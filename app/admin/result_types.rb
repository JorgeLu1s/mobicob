ActiveAdmin.register ResultType do
  permit_params %i[id code name description management_type_id]

  menu priority: 9

  filter :code
  filter :name
  filter :management_type

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
    column :management_type
    column :created_at
    actions
  end

  show do |result_type|
    attributes_table do
      rows :id, :code, :name, :description, :management_type, :created_at, :updated_at
      row :tasks do
          result_type.tasks.map{ |task| link_to(task.id, admin_task_path(task)) }.join(", ").html_safe
      end
    end
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :code
      f.input :name
      f.input :description
      f.input :management_type
    end
    f.actions
  end

end
