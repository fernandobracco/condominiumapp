json.extract! aviso, :id, :usuario_id, :texto, :created_at, :updated_at
json.url aviso_url(aviso, format: :json)
