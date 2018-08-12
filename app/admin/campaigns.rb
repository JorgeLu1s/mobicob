ActiveAdmin.register Campaign do
  permit_params %i[id number source state init_date finish_date]

  menu priority: 2

  action_item only: :index do
    link_to 'Import Campaigns', admin_campaigns_import_path
  end

  collection_action :import_csv, method: :post do
    begin
      raise 'Must attach a file' if params[:file]==nil
      CSV.foreach(params[:file].path, headers: true) do |row|
        
        if row['Contratista'] == "CAM S.A.S"
          campaign = Campaign.find_or_create_by(number: row["#Campaña"])
          campaign.assign_attributes(
            source: "file",
            state: Campaign.states[:generated]
          )
          campaign.save

          delegation = Delegation.find_or_create_by(name: row['Delegacion'])
          delegation.assign_attributes(
            code: row['Delegacion']
          )
          delegation.save

          client = Client.find_or_create_by(NIC: row['Nic'])
          client.assign_attributes(
            unicom: row['Unicom'],
            delegation_id: delegation.id,
            NIS: row['NisRad'].to_i,
            departament: row['Departamento'],
            municipality: row['Municipio'],
            corregimiento: row['Corregimiento'],
            neighborhood: row['Barrio'],
            street_type: row['Tipo Via'],
            street_name: row['Nombre Calle'],
            duplicator: row['Duplicador'],
            number: row['Nro'].to_i,
            CGV: row['Cgv'],
            address: row['Direccion Ref.'],
            name: row['Cliente'],
            id_number: row['Cedula'].to_i,
            phone: row['Telefono'],
            rate: row['Tarifa'],
            state: row['Estado'],
            route: row['Ruta'].to_i,
            reading_itinerary: row['Itin. Lectura'].to_i,
            AOL: row['AOL Finca'].to_i,
            measurer: row['Medidor'],
            measurer_type: row['T. Aparato'],
            measurer_brand: row['Marca Medidor'],
            energy_debt: row['Deuda Energia'].to_i,
            irregular_debt: row['Deuda Irreg.'].to_i,
            third_party_debt: row['Deuda Terceros'].to_i,
            financed_debt: row['Deuda Financ.'].to_i,
            overdue_bills: row['Fact. Vencidas'].to_i,
            agreed_bills: row['Fact. Acordadas'].to_i
          )
          client.save

          task = Task.find_or_create_by(campaign: campaign, client: client)
          task.assign_attributes(
            period: row['Periodo'].to_i,
            plan: row['Plan'],
            validity: nil, ##
            due_date: row['F.Entrega'],
            campaign_id: campaign.id,
            client_id: client.id
          )
          task.save

          #:user
          #:estimated_time
        end
      end
      redirect_to admin_campaigns_path, notice: "CSV imported successfully!"
    rescue StandardError => e
      redirect_to admin_campaigns_path, alert: e.to_s
      puts e
    end
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
      f.input :state, as: :select,
        collection: Campaign.states.keys.map{ |item| [item.titleize, item] }
      f.input :init_date
      f.input :finish_date
      if f.object.new_record?
        f.input :source, input_html: { value: "form" }, as: :hidden
      end
    end
    f.actions
  end
end
