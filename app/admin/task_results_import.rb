ActiveAdmin.register_page "Task Results Import" do
  menu false

  breadcrumb do
    [link_to('Admin', admin_root_path), link_to('Tasks', admin_tasks_path)]
  end

  content do
    render partial: 'form'
  end
end
