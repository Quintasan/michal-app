json.extract! event, :id, :name, :city, :address, :created_at, :updated_at
json.url event_url(event, format: :json)
