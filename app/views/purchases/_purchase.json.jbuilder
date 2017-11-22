json.extract! purchase, :id, :user_id, :provider_id, :total, :created_at, :updated_at
json.url purchase_url(purchase, format: :json)
