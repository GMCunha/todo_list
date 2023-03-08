json.extract! item, :id, :description, :marked, :list_id, :created_at, :updated_at
json.url item_url(item, format: :json)
