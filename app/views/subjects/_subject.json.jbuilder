json.extract! subject, :id, :name, :code, :description, :created_at, :updated_at
json.url subject_url(subject, format: :json)
