json.extract! teacher_certification, :id, :certifier, :date_obtained, :subject_id, :teacher_id, :created_at, :updated_at
json.url teacher_certification_url(teacher_certification, format: :json)
