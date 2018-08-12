ActiveAdmin.register_page "Campaigns Import" do
  menu false

  breadcrumb do
    [link_to('Admin', admin_root_path), link_to('Campaigns', admin_campaigns_path)]
  end

  content do
    render partial: 'form'
  end
end
