ActiveAdmin.register AnomalyType do
  permit_params %i[id code name description result_type_id]

  menu priority: 10

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

  filter :code
  filter :name
  filter :result_type

  index do
    selectable_column
    id_column
    column :code
    column :name
    column :result_type
    column :created_at
    actions
  end

  show do |anomaly_type|
    attributes_table do
      rows :id, :code, :name, :description, :result_type, :created_at, :updated_at
      row :tasks do
          anomaly_type.tasks.map{ |task| link_to(task.id, admin_task_path(task)) }.join(", ").html_safe
      end
    end
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :code
      f.input :name
      f.input :description
      f.input :result_type
    end
    f.actions
  end

end
