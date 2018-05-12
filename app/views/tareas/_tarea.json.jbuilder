json.extract! tarea, :id, :empleado_id, :tipo_id, :estado_id, :prioridad_id, :comentario, :created_at, :updated_at
json.url tarea_url(tarea, format: :json)
