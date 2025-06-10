json.extract! course, :id, :code, :school_year, :description, :required_equipment, :teacher_id, :subject_id, :created_at, :updated_at
json.url course_url(course, format: :json)
