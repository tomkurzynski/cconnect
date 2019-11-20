json.extract! site_content, :id, :title, :header1, :header2, :description1, :description2, :image, :created_at, :updated_at
json.url site_content_url(site_content, format: :json)
