json.extract! filter, :id, :category, :price, :brand, :weight, :created_at, :updated_at
json.url filter_url(filter, format: :json)
