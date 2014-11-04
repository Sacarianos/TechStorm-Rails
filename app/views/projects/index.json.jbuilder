json.array!(@projects) do |project|
  json.extract! project, :id, :creator_id, :name, :description
  json.url project_url(project, format: :json)
end
