json.extract! message, :id, :name, :number, :text, :created_at, :updated_at
json.url message_url(message, format: :json)
