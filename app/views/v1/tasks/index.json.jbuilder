json.data do
  json.tasks @tasks do |task|
    json.task task
    json.client task.client
  end
end
