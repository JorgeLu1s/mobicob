ActiveAdmin.register ManagementType do
  permit_params %i[id code name description]

  menu priority: 8

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

  show do |management_type|
    attributes_table do
      rows :id, :code, :name, :description, :created_at, :updated_at
      row :tasks do
          management_type.tasks.map{ |task| link_to(task.id, admin_task_path(task)) }.join(", ").html_safe
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
