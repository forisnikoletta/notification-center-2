json.extract! notification, :id, :title, :body, :users_id, :seen, :created_at, :updated_at
json.url notification_url(notification, format: :json)
