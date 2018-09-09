ActiveAdmin.register AnomalyType do
  permit_params %i[id code name description result_type_id],
    result_anomaly_matches_attributes: %i[id result_type_id anomaly_type_id _destroy]

  menu priority: 10

  filter :code
  filter :name
  filter :result_types

  controller do
    helper_method :allowed_roles

    def allowed_roles
      allowed_roles = Role.basic_roles.dup
      allowed_roles.delete(:back)
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
    column :result_types do |anomaly|
      anomaly.result_types.map{
        |result| link_to(result.name, admin_result_type_path(result))
      }.join(", ").html_safe
    end
    actions
  end

  show do |anomaly_type|
    attributes_table do
      rows :id, :code, :name, :description, :created_at, :updated_at
      row :result_types do
          anomaly_type.result_types.map{ |result|
            link_to(result.name, admin_result_type_path(result))
          }.join(", ").html_safe
      end
      row :tasks do
          anomaly_type.tasks.map{ |task|
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
      f.has_many :result_anomaly_matches, allow_destroy: true,
                  heading: 'Tipos de Resultado',
                  new_record: 'Agregar Tipo de Resultado' do |n_f|
        n_f.input :result_type
      end
    end
    f.actions
  end

end
