ActiveAdmin.register Task do
  permit_params %i[id period plan validity campaign_id client_id]

  menu priority: 3

  controller do
    
  end

  filter :period
  filter :campaign
  filter :client

  index do
    selectable_column
    id_column
    column :period
    column :plan
    column :validity
    column :campaign
    column :client
    column :created_at
    actions
  end

  show do |task|
    attributes_table do
      rows :id, :period, :plan, :validity, :campaign, :client, :created_at,
      :updated_at
      row :assignments do
          task.assignments.map{ |assignment| link_to(assignment.id, 
            admin_assignment_path(assignment)) }.join(", ").html_safe
      end
    end
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :period
      f.input :plan
      f.input :validity, as: :select,
        collection: Task.validities.keys.map{ |item| [item.titleize, item] }
      f.input :campaign
      f.input :client
    end
    f.actions
  end

end
