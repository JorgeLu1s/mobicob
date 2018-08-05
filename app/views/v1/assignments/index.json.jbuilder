json.data do
  json.assignments @assignments do |assignment|
    json.assignment assignment
    json.task assignment.task
    json.client assignment.task.client
  end
end
