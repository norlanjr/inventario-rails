json.extract! client, :id, :nombre, :cedula, :telefono, :direccion, :credito, :created_at, :updated_at
json.url client_url(client, format: :json)
