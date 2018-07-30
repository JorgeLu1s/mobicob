ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation

  controller do
    def action_methods
      super - ['destroy']
    end
  end

  index do
    selectable_column
    id_column
    column :id_number
    column :name
    column :lastname
    column :position
    column :delegation
    column :role
    column :phone
    column :email
    column :active
    actions
  end

  filter :position
  filter :delegation
  filter :role
  filter :active

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :id_number
      f.input :name
      f.input :lastname
      f.input :position
      f.input :delegation
      f.input :role
      f.input :phone
      f.input :address
      f.input :email
      f.input :active
      if f.object.new_record?
        f.input :password
        f.input :password_confirmation
      end
    end
    f.actions
  end

end
