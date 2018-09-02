ActiveAdmin.register Task do
  permit_params %i[id plan validity campaign_id client_id collection_entity
    commitment_date due_date email id_number latitude longitude management_date
    observations payment_date payment_holder personal_contact phone
    reading_signature estimated_time anomaly_type_id management_type_id
    result_type_id user_id dataphone_payment]

  menu priority: 3

  action_item only: :index,
  if: proc { current_user != nil && allowed_roles.values.include?(current_user.role.code) } do
    link_to 'Import Tasks', admin_tasks_import_path
  end

  filter :campaign
  filter :client
  filter :user
  filter :due_date
  filter :result_type
  filter :management_type_id
  filter :anomaly_type_id
  filter :management_date_null, :as => :boolean

  controller do
    helper_method :allowed_roles, :assignable_users

    def allowed_roles
      allowed_roles = Role.basic_roles.dup
      allowed_roles.delete(:web)
      allowed_roles.delete(:mobile)
      return allowed_roles
    end

    def scoped_collection
      super.includes(:roles)
      if current_user != nil && allowed_roles.values.include?(current_user.role.code)
        return Task.all
      else
        return current_user.tasks
      end
    end

    def action_methods
      if current_user != nil && allowed_roles.values.include?(current_user.role.code)
        super
      else
        ['index', 'show', 'edit', 'update']
      end
    end

    def assignable_users
      assignable_roles = Role.basic_roles.dup
      assignable_roles.delete(:admin)
      assignable_roles.delete(:back)
      User.where(active: true, role_id: assignable_roles.values)
    end
  end

  index do
    selectable_column
    id_column
    column :campaign
    column :due_date
    column 'Unicom' do |item|
      item.client.unicom
    end
    column 'NIC' do |item|
      item.client.NIC
    end
    column 'NIS' do |item|
      item.client.NIS
    end
    column 'Departament' do |item|
      item.client.departament
    end
    column 'Municipality' do |item|
      item.client.municipality
    end
    column 'Corregimiento' do |item|
      item.client.corregimiento
    end
    column 'Neighborhood' do |item|
      item.client.neighborhood
    end
    column 'Street_type' do |item|
      item.client.street_type
    end
    column 'Street_name' do |item|
      item.client.street_name
    end
    column 'Duplicator' do |item|
      item.client.duplicator
    end
    column 'Number' do |item|
      item.client.number
    end
    column 'CGV' do |item|
      item.client.CGV
    end
    column 'Address' do |item|
      item.client.address
    end
    column 'Client' do |item|
      item.client.name
    end
    column 'Id_number' do |item|
      item.client.id_number
    end
    column 'Phone' do |item|
      item.client.phone
    end
    column 'Rate' do |item|
      item.client.rate
    end
    column 'State' do |item|
      item.client.state
    end
    column 'Route' do |item|
      item.client.route
    end
    column 'Reading_itinerary' do |item|
      item.client.reading_itinerary
    end
    column 'AOL' do |item|
      item.client.AOL
    end
    column 'Measurer' do |item|
      item.client.measurer
    end
    column 'Measurer_type' do |item|
      item.client.measurer_type
    end
    column 'Measurer_brand' do |item|
      item.client.measurer_brand
    end
    column 'Energy_debt' do |item|
      item.client.energy_debt
    end
    column 'Irregular_debt' do |item|
      item.client.irregular_debt
    end
    column 'Third_party_debt' do |item|
      item.client.third_party_debt
    end
    column 'Financed_debt' do |item|
      item.client.financed_debt
    end
    column 'Overdue_bills' do |item|
      item.client.overdue_bills
    end
    column 'Agreed_bills' do |item|
      item.client.agreed_bills
    end
    column :dataphone_payment
    column 'Period' do |item|
      item.campaign.period
    end
    column :plan
    column 'Contractor' do |item|
      item.user ? item.user.contractor.name : ''
    end
    column 'Delegation' do |item|
      item.client.delegation.name
    end
    actions
  end

  show do |task|
    attributes_table do
      rows :id, :created_at, :updated_at, :user, :due_date
      row :estimated_time do
        if task.estimated_time == nil
          '00:00'
        else
          task.estimated_time.strftime('%H:%M')
        end
      end

      row :campaign
      row :due_date
      row 'Unicom' do
        task.client.unicom
      end
      row 'NIC' do
        task.client.NIC
      end
      row 'NIS' do
        task.client.NIS
      end
      row 'Departament' do
        task.client.departament
      end
      row 'Municipality' do
        task.client.municipality
      end
      row 'Corregimiento' do
        task.client.corregimiento
      end
      row 'Neighborhood' do
        task.client.neighborhood
      end
      row 'Street_type' do
        task.client.street_type
      end
      row 'Street_name' do
        task.client.street_name
      end
      row 'Duplicator' do
        task.client.duplicator
      end
      row 'Number' do
        task.client.number
      end
      row 'CGV' do
        task.client.CGV
      end
      row 'Address' do
        task.client.address
      end
      row 'Client' do
        task.client.name
      end
      row 'Id_number' do
        task.client.id_number
      end
      row 'Phone' do
        task.client.phone
      end
      row 'Rate' do
        task.client.rate
      end
      row 'State' do
        task.client.state
      end
      row 'Route' do
        task.client.route
      end
      row 'Reading_itinerary' do
        task.client.reading_itinerary
      end
      row 'AOL' do
        task.client.AOL
      end
      row 'Measurer' do
        task.client.measurer
      end
      row 'Measurer_type' do
        task.client.measurer_type
      end
      row 'Measurer_brand' do
        task.client.measurer_brand
      end
      row 'Energy_debt' do
        task.client.energy_debt
      end
      row 'Irregular_debt' do
        task.client.irregular_debt
      end
      row 'Third_party_debt' do
        task.client.third_party_debt
      end
      row 'Financed_debt' do
        task.client.financed_debt
      end
      row 'Overdue_bills' do
        task.client.overdue_bills
      end
      row 'Agreed_bills' do
        task.client.agreed_bills
      end
      row :dataphone_payment
      row 'Period' do
        task.campaign.period
      end
      row :plan
      row 'Contractor' do
        task.user ? task.user.contractor.name : ''
      end
      row 'Delegation' do
        task.client.delegation.name
      end

      row :used_time do
        if task.used_time == nil
          '00:00'
        else
          task.used_time.strftime('%H:%M')
        end
      end

      rows :management_date,
        :management_type, :result_type, :anomaly_type, :collection_entity,
        :payment_date, :commitment_date, :personal_contact, :id_number,
        :payment_holder, :phone, :email, :observations, :reading_signature,
        :dataphone_payment, :latitude, :longitude
    end
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :plan
      f.input :validity, as: :select,
        collection: Task.validities.keys.map{ |item| [item.titleize, item] }
      f.input :campaign
      f.input :client
      f.input :user, as: :select, collection: assignable_users
      f.input :due_date
      f.input :estimated_time
      unless f.object.new_record?
        f.input :management_date
        f.input :management_type
        f.input :result_type
        f.input :anomaly_type
        f.input :collection_entity
        f.input :payment_date
        f.input :commitment_date
        f.input :personal_contact
        f.input :id_number
        f.input :payment_holder
        f.input :phone
        f.input :email
        f.input :observations
        f.input :reading_signature
        f.input :dataphone_payment
        f.input :used_time
        f.input :latitude
        f.input :longitude
      end
    end
    f.actions
  end

  collection_action :import_csv, method: :post do
    begin
      raise 'Must attach a file' if params[:file]==nil
      CSV.foreach(params[:file].path, headers: true, col_sep: '|') do |row|

        users = User.where(email: row["email"])
        clients = Client.where(NIC: row['Nic'])
        campaigns = Campaign.where(number: row["#Campaña"])
        actualizar = row["actualizar"]

        if users.any? && clients.any? && campaigns.any?
          user = users.first
          client = clients.first
          campaign = campaigns.first

          if actualizar == "SI"
            tasks = Task.where(client_id: client.id, campaign_id: campaign.id)
            if tasks.any?
              task = tasks.first
              task.assign_attributes({
                plan: row['Plan'],
                due_date: row['F.Entrega'],
                user_id: user.id,
                estimated_time: row['Estimado']
              })
            else
              task = Task.new(
                plan: row['Plan'],
                due_date: row['F.Entrega'],
                campaign_id: campaign.id,
                client_id: client.id,
                user_id: user.id,
                estimated_time: row['Estimado']
              )
            end
          else
            task = Task.new(
              plan: row['Plan'],
              due_date: row['F.Entrega'],
              campaign_id: campaign.id,
              client_id: client.id,
              user_id: user.id,
              estimated_time: row['Estimado']
            )
          end
          task.save
        else
          raise '#Campaña, email and Nic are required and must be in the system'
        end
      end
      redirect_to admin_tasks_path, notice: "CSV imported successfully!"
    rescue StandardError => e
      redirect_to admin_tasks_path, alert: e.to_s
      puts e
    end
  end

  csv col_sep: '|' do
    column("Delegacion") { |task|
      if task.client != nil
        task.client.delegation.code+" - "+task.client.delegation.name
      end
    }
    column("Contratista") {  |task|
      if task.user != nil && task.user.contractor != nil
        task.user.contractor.code+" - "+task.user.contractor.name
      end
    }
    column("#Campaña") { |task|
      if task.campaign != nil
        task.campaign.number
      end
    }
    column("F.Entrega") { |task|
      if task.due_date != nil
        task.due_date.strftime("%d/%m/%Y")
      end
    }
    column("Nic") { |task|
      if task.client != nil
        task.client.NIC
      end
    }
    column("NisRad") { |task|
      if task.client != nil
        task.client.NIS
      end
    }
    column("F.Gestion") { |task|
      if task.management_date != nil
        task.management_date.strftime("%d/%m/%Y")
      end
    }
    column("T.Gestion") { |task|
      if task.management_type != nil
        task.management_type.name
      end
    }
    column("Resultado") { |task|
      if task.result_type != nil
        task.result_type.name
      end
    }
    column("Anomalia") { |task|
      if task.anomaly_type != nil
        task.anomaly_type.code
      end
    }
    column("Entidad Recaudo") { |task|
      if task.collection_entity != nil
        task.collection_entity
      end
    }
    column("F.Pago") { |task|
      if task.payment_date != nil
        task.payment_date.strftime("%d/%m/%Y")
      end
    }
    column("F.Com.Pago") { |task|
      if task.commitment_date != nil
        task.commitment_date
      end
    }
    column("Pers.Contacto") { |task|
      if task.personal_contact != nil
        task.personal_contact ? "SI" : "NO"
      end
    }
    column("Cedula") { |task|
      if task.id_number != nil
        task.id_number
      end
    }
    column("Tit.Pago") { |task|
      if task.payment_holder != nil
        task.payment_holder
      end
    }
    column("Telefono") { |task|
      if task.phone != nil
        task.phone
      end
    }
    column("Email") { |task|
      if task.email != nil
        task.email
      end
    }
    column("Observaciones") { |task|
      if task.observations != nil
        task.observations
      end
    }
    column("Lectura Firma") { |task|
      if task.reading_signature != nil
        task.reading_signature
      end
    }
    column("Gestor Cobro") { |task|
      if task.user != nil
        task.user.name+" "+task.user.lastname
      end
    }
    column("Hora Duracion") { |task|
      if task.used_time != nil
        task.used_time.strftime('%H:%M:%S')
      end
    }
    column("Punto GPS") { |task|
      if task.longitude != nil && task.latitude != nil
        task.longitude.to_s+"/"+task.latitude.to_s
      end
    }
  end

end
