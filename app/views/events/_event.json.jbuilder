json.extract! event, :id, :title, :body, :start, :end, :created_at, :updated_at
json.url event_url(event, format: :json)
