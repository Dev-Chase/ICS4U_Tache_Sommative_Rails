json.extract! student_course, :id, :course_id, :student_id, :average_grade, :credit_obtained, :created_at, :updated_at
json.url student_course_url(student_course, format: :json)
