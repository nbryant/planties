json.extract! plant, :id, :timestamps, :event, :scientific_name, :common_name, :light, :created_at, :updated_at
json.url plant_url(plant, format: :json)
