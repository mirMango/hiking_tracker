json.extract! hike, :id, :name, :distance, :description, :created_at, :updated_at
json.url hike_url(hike, format: :json)
