json.extract! student, :id, :first_name, :last_name, :age, :grade_level, :grade_average, :emergency_contact, :credits_obtained, :created_at, :updated_at
json.url student_url(student, format: :json)
