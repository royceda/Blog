json.array!(@tasks) do |task|
  json.extract! task, :id, :text
  json.url task_url(task, format: :json)
end
