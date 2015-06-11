json.array!(@parents) do |parent|
  json.extract! parent, :id, :name, :email, :student_id
  json.url parent_url(parent, format: :json)
end
