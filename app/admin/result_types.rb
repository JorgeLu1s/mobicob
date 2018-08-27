ActiveAdmin.register ResultType do
  permit_params %i[id code name description management_type_id]

  menu priority: 9

  controller do
    
  end

  filter :code
  filter :name
  filter :management_type

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
