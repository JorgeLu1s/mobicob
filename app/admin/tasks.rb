ActiveAdmin.register Task do
  permit_params %i[id period plan validity campaign_id client_id collection_entity
    commitment_date due_date email id_number latitude longitude management_date
    observations payment_date payment_holder personal_contact phone
    reading_signature estimated_time anomaly_type_id management_type_id
    result_type_id user_id dataphone_payment]

  menu priority: 3

  action_item only: :index do
    link_to 'Import Tasks', admin_tasks_import_path
  end

  collection_action :import_csv, method: :post do
    begin
      raise 'Must attach a file' if params[:file]==nil
      CSV.foreach(params[:file].path, headers: true) do |row|


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

  filter :period
  filter :campaign
  filter :client
  filter :user
  filter :result_type
  filter :management_type_id
  filter :anomaly_type_id

  index do
    selectable_column
    id_column
    column :period
    column :campaign
    column :client
    column :user
    column :due_date
    column :created_at
    column :management_date
    actions
  end

  csv do
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

  show do |task|
    attributes_table do
      rows :id, :period, :plan, :validity, :campaign, :client, :created_at,
      :updated_at, :user, :due_date
      row :estimated_time do
        if task.estimated_time == nil
          '00:00'
        else
          task.estimated_time.strftime('%H:%M')
        end
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
      f.input :period
      f.input :plan
      f.input :validity, as: :select,
        collection: Task.validities.keys.map{ |item| [item.titleize, item] }
      f.input :campaign
      f.input :client
      f.input :user
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

end
