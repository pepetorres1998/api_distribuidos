json.extract! client, :id, :ip, :cpu, :ram, :server, :active, :created_at, :updated_at
json.url client_url(client, format: :json)
