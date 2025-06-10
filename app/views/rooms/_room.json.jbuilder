json.extract! room, :id, :code, :floor_level, :building_id, :directions, :created_at, :updated_at
json.url room_url(room, format: :json)
