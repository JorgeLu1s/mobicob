ActiveAdmin.register Task do
  permit_params %i[id plan validity campaign_id client_id collection_entity
    commitment_date due_date email id_number latitude longitude management_date
    observations payment_date payment_holder personal_contact phone
    reading_signature estimated_time anomaly_type_id management_type_id
    result_type_id user_id dataphone_payment]

  menu priority: 3

  action_item only: :index,
  if: proc { current_user != nil && allowed_roles.values.include?(current_user.role.code) } do
    link_to 'Importar Tareas', admin_tasks_import_path
  end

  action_item only: :index,
  if: proc { current_user != nil && allowed_roles.values.include?(current_user.role.code) } do
    link_to 'Importar Resultado Tareas', admin_task_results_import_path
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
    column :unicom do |item|
      item.client.unicom
    end
    column :NIC do |item|
      item.client.NIC
    end
    column :NIS do |item|
      item.client.NIS
    end
    column :departament do |item|
      item.client.departament
    end
    column :municipality do |item|
      item.client.municipality
    end
    column :corregimiento do |item|
      item.client.corregimiento
    end
    column :neighborhood do |item|
      item.client.neighborhood
    end
    column :street_type do |item|
      item.client.street_type
    end
    column :street_name do |item|
      item.client.street_name
    end
    column :duplicator do |item|
      item.client.duplicator
    end
    column :number do |item|
      item.client.number
    end
    column :CGV do |item|
      item.client.CGV
    end
    column :address do |item|
      item.client.address
    end
    column :name do |item|
      item.client.name
    end
    column :id_number do |item|
      item.client.id_number
    end
    column :phone do |item|
      item.client.phone
    end
    column :rate do |item|
      item.client.rate
    end
    column :state do |item|
      item.client.state
    end
    column :route do |item|
      item.client.route
    end
    column :reading_itinerary do |item|
      item.client.reading_itinerary
    end
    column :AOL do |item|
      item.client.AOL
    end
    column :measurer do |item|
      item.client.measurer
    end
    column :measurer_type do |item|
      item.client.measurer_type
    end
    column :measurer_brand do |item|
      item.client.measurer_brand
    end
    column :energy_debt do |item|
      item.client.energy_debt
    end
    column :irregular_debt do |item|
      item.client.irregular_debt
    end
    column :third_party_debt do |item|
      item.client.third_party_debt
    end
    column :financed_debt do |item|
      item.client.financed_debt
    end
    column :overdue_bills do |item|
      item.client.overdue_bills
    end
    column :agreed_bills do |item|
      item.client.agreed_bills
    end
    column :dataphone_payment
    column :period do |item|
      item.campaign.period
    end
    column :plan
    column :contractor do |item|
      item.user && item.user.contractor ? item.user.contractor.name : ''
    end
    column :delegation do |item|
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
      row :unicom do
        task.client.unicom
      end
      row :NIC do
        task.client.NIC
      end
      row :NIS do
        task.client.NIS
      end
      row :departament do
        task.client.departament
      end
      row :municipality do
        task.client.municipality
      end
      row :corregimiento do
        task.client.corregimiento
      end
      row :neighborhood do
        task.client.neighborhood
      end
      row :street_type do
        task.client.street_type
      end
      row :street_name do
        task.client.street_name
      end
      row :duplicator do
        task.client.duplicator
      end
      row :number do
        task.client.number
      end
      row :CGV do
        task.client.CGV
      end
      row :address do
        task.client.address
      end
      row :client do
        task.client.name
      end
      row :id_number do
        task.client.id_number
      end
      row :phone do
        task.client.phone
      end
      row :rate do
        task.client.rate
      end
      row :state do
        task.client.state
      end
      row :route do
        task.client.route
      end
      row :reading_itinerary do
        task.client.reading_itinerary
      end
      row :AOL do
        task.client.AOL
      end
      row :measurer do
        task.client.measurer
      end
      row :measurer_type do
        task.client.measurer_type
      end
      row :measurer_brand do
        task.client.measurer_brand
      end
      row :energy_debt do
        task.client.energy_debt
      end
      row :irregular_debt do
        task.client.irregular_debt
      end
      row :third_party_debt do
        task.client.third_party_debt
      end
      row :financed_debt do
        task.client.financed_debt
      end
      row :overdue_bills do
        task.client.overdue_bills
      end
      row :agreed_bills do
        task.client.agreed_bills
      end
      row :dataphone_payment
      row :period do
        task.campaign.period
      end
      row :plan
      row :contractor do
        task.user && task.user.contractor ? task.user.contractor.name : ''
      end
      row :delegation do
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
    f.inputs "Asignación" do
      f.input :plan
      f.input :validity, as: :select,
        collection: Task.validities.keys.map{ |item| [item.titleize, item] }
      f.input :campaign
      f.input :client
      f.input :user, as: :select, collection: assignable_users
      f.input :due_date
      f.input :estimated_time
    end
    unless f.object.new_record?
      f.inputs "Resultado" do
        f.input :management_date
        f.input :management_type

        f.input :result_type,  :as => :select, :input_html =>
          {
            'data-option-dependent' => true,
            'data-option-url' => '/admin/result_types.json?q[management_type_id_eq]=',
            'data-option-observed' => 'task_management_type_id'
          },
          :collection => (resource.management_type ?
            resource.management_type.result_types.collect {
              |result_type| [result_type.name, result_type.id]
            } : [])

        f.input :anomaly_type, :as => :select, :input_html =>
          {
            'data-option-dependent' => true,
            'data-option-url' => '/admin/anomaly_types.json?q[result_type_id_eq]=',
            'data-option-observed' => 'task_result_type_id'
          },
          :collection => (resource.result_type ?
            resource.result_type.anomaly_types.collect {
              |anomaly_type| [anomaly_type.name, anomaly_type.id]
            } : [])

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

  collection_action :import_csv_results, method: :post do
    begin
      raise 'Must attach a file' if params[:file]==nil
      CSV.foreach(params[:file].path, headers: true, col_sep: '|') do |row|

        task = Task.find(row["Tarea"])
        users = User.where(email: row["Gestor Cobro"])
        management_types = ManagementType.where(name: row["T.Gestion"])
        result_types = ResultType.where(name: row["Resultado"])
        anomaly_types = AnomalyType.where(name: row["Anomalia"])

        if task != nil && users.any? && management_types.any? && result_types.any? && anomaly_types.any?

          user = users.first
          management_type = management_types.first
          result_type = result_types.first
          anomaly_type = anomaly_types.first

          if task.user != user
            task = task.dup
          end

          task.assign_attributes({
            management_date: row['F.Gestion'],
            management_type_id: management_type.id,
            result_type_id: result_type.id,
            anomaly_type_id: anomaly_type.id,

            collection_entity: row['Entidad Recaudo'],
            payment_date: row['F.Pago'],
            commitment_date: row['F.Com.Pago'],
            personal_contact: row['Pers.Contacto'],
            id_number: row['Cedula'],
            payment_holder: row['Tit.Pago'],
            phone: row['Telefono'],
            email: row['Email'],
            observations: row['Observaciones'],
            reading_signature: row['Lectura Firma'],

            user_id: user.id,
            used_time: row['Hora Duracion'],
            latitude: row['Punto GPS'].split('/')[0],
            longitude: row['Punto GPS'].split('/')[1]
          })
          task.save
        else
          raise 'Tarea, Gestor, T.Gestion, Resultado and Anomalia are required and must be in the system'
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
        task.client.delegation.code
      end
    }
    column("Contratista") {  |task|
      if task.user != nil && task.user.contractor != nil
        task.user.contractor.code
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
        task.management_type.code
      end
    }
    column("Resultado") { |task|
      if task.result_type != nil
        task.result_type.code
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
