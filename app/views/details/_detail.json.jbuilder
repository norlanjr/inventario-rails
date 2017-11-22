json.extract! detail, :id, :article_id, :cantidad, :precio, :descuneto, :sub_total, :total, :abierta, :created_at, :updated_at
json.url detail_url(detail, format: :json)
