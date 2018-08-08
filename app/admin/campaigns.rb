ActiveAdmin.register Campaign do
  permit_params %i[id number source state init_date finish_date]

  menu priority: 2

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

  active_admin_importable do |model, row, is_last_row, current_user|
    begin

      if row[:'contratista'] == "CAM S.A.S"
        campaign = Campaign.create_with(
          number: row[:"campana"],
          source: "file",
          state: Campaign.states[:generated]
        ).find_or_create_by(number: row[:"campana"])

        delegations_with_name = Delegation.where(name: row[:'delegacion'])

        if delegations_with_name.any?
          delegation = delegations_with_name.first
        else
          delegation = Delegation.create(code: Delegation.last.code + 1, name: row[:'delegacion'])
        end

        client = Client.create_with(
          NIC: row[:'nic'].to_i,
          unicom: row[:'unicom'],
          delegation: delegation,
          NIS: row[:'nisrad'].to_i,
          departament: row[:'departamento'],
          municipality: row[:'municipio'],
          corregimiento: row[:'corregimiento'],
          neighborhood: row[:'barrio'],
          street_type: row[:'tipo_via'],
          street_name: row[:'nombre_calle'],
          duplicator: row[:'duplicador'],
          number: row[:'nro'].to_i,
          CGV: row[:'cgv'],
          address: row[:'direccion_ref'],
          name: row[:'cliente'],
          id_number: row[:'cedula'].to_i,
          phone: row[:'telefono'],
          rate: row[:'tarifa'],
          state: row[:'estado'],
          route: row[:'ruta'].to_i,
          reading_itinerary: row[:'itin_lectura'].to_i,
          AOL: row[:'aol_finca'].to_i,
          measurer: row[:'medidor'],
          measurer_type: row[:'t_aparato'],
          measurer_brand: row[:'marca_medidor'],
          energy_debt: row[:'deuda_energia'].to_i,
          irregular_debt: row[:'deuda_irreg'].to_i,
          third_party_debt: row[:'deuda_terceros'].to_i,
          financed_debt: row[:'deuda_financ'].to_i,
          overdue_bills: row[:'fact_vencidas'].to_i,
          agreed_bills: row[:'fact_acordadas'].to_i

        ).find_or_create_by(NIC: row[:'nic'])

        task = Task.create_with(
          period: row[:'periodo'].to_i,
          plan: row[:'plan'],
          validity: nil, ##
          due_date: f_entrega,
          campaign: campaign,
          client: client
        ).find_or_create_by(campaign: campaign, client: client)

        #:user
        #:due_date
        #:estimated_time
      end

    rescue StandardError => e
      puts e
    end
  end
end
