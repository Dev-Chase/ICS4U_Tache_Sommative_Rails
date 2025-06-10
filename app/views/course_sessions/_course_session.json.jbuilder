json.extract! course_session, :id, :course_id, :room_id, :start_time, :duration, :day_of_week, :created_at, :updated_at
json.url course_session_url(course_session, format: :json)
