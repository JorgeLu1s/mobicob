ActiveAdmin.register User do

  permit_params %i[id email password password_confirmation id_number name
    lastname position delegation_id contractor_id role_id phone address email active]

  menu priority: 2

  filter :delegation
  filter :contractor
  filter :role
  filter :position
  filter :active

  controller do
    def action_methods
      if current_user != nil && (current_user.role.code == '4' ||
        current_user.role.code == '3' || current_user.role.code == '2')
        ['index', 'show']
      else
        super - ['destroy']
      end
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
    column :contractor
    column :role
    column :phone
    column :email
    column :active
    actions
  end

  show do |user|
    attributes_table do
      rows :id, :id_number, :name, :lastname, :position, :delegation, :role,
      :phone, :address, :email, :active, :contractor, :created_at, :updated_at,
      :current_sign_in_at, :sign_in_count
    end
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :id_number
      f.input :name
      f.input :lastname
      f.input :position
      f.input :delegation
      f.input :contractor
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
