json.extract! comentario, :id, :comentario, :tarea_id, :user_id, :created_at, :updated_at
json.url comentario_url(comentario, format: :json)
