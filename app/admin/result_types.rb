ActiveAdmin.register ResultType do
  permit_params %i[id code name description management_type_id],
    management_result_matches_attributes: %i[id management_type_id result_type_id _destroy]

  menu priority: 9

  filter :code
  filter :name
  filter :management_types

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
    column :management_types do |result|
      result.management_types.map{
        |management| link_to(management.name, admin_management_type_path(management))
      }.join(", ").html_safe
    end
    actions
  end

  show do |result_type|
    attributes_table do
      rows :id, :code, :name, :description, :created_at, :updated_at
      row :management_types do
          result_type.management_types.map{ |management|
            link_to(management.name, admin_management_type_path(management))
          }.join(", ").html_safe
      end
      row :tasks do
          result_type.tasks.map{ |task|
            link_to(task.id, admin_task_path(task))
          }.join(", ").html_safe
      end
    end
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :code
      f.input :name
      f.input :description
      f.has_many :management_result_matches, allow_destroy: true,
                  heading: 'Tipos de Gestión',
                  new_record: 'Agregar Tipo de Gestión' do |n_f|
        n_f.input :management_type
      end
    end
    f.actions
  end

end
