ActiveAdmin.register Campaign do
  permit_params %i[id number source state init_date finish_date]

  controller do
    
  end

  filter :number
  filter :source
  filter :state

  index do
    selectable_column
    id_column
    column :number
    column :source
    column :state
    column :init_date
    column :finish_date
    column :created_at
    actions
  end

  show do |campaign|
    attributes_table do
      rows :id, :number, :source, :state, :init_date, :finish_date, :created_at,
      :updated_at
      row :tasks do
          campaign.tasks.map{ |task| link_to(task.id, 
            admin_task_path(task)) }.join(", ").html_safe
      end
    end
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :number
      f.input :state
      f.input :init_date
      f.input :finish_date
    end
    f.actions
  end

end
