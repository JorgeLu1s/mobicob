json.data do
  json.contractors @contractors
  json.delegations @delegations
  json.management_types @management_types
  json.result_types @result_types do |result_type|
    json.id          result_type.id
    json.code        result_type.code
    json.name        result_type.name
    json.description result_type.description
    json.created_at  result_type.created_at
    json.updated_at  result_type.updated_at
    json.management_types result_type.management_types do |management_type|
      json.id          management_type.id
    end
  end
  json.anomaly_types @anomaly_types do |anomaly_type|
    json.id          anomaly_type.id
    json.code        anomaly_type.code
    json.name        anomaly_type.name
    json.description anomaly_type.description
    json.created_at  anomaly_type.created_at
    json.updated_at  anomaly_type.updated_at
    json.result_types anomaly_type.result_types do |result_type|
      json.id          result_type.id
    end
  end
  json.roles @roles
end
