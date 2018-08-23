json.data do
  json.tasks @tasks do |task|
    json.id task.id
    json.plan task.plan
    json.validity task.validity
    json.campaign task.campaign
    json.created_at task.created_at
    json.updated_at task.updated_at
    json.due_date task.due_date
    json.estimated_time task.estimated_time
    json.user_id task.user_id
    json.client task.client
  end
end
