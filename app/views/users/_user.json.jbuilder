json.extract! user, :id, :email, :name, :bio, :created_at, :updated_at
json.url user_url(user, format: :json)
