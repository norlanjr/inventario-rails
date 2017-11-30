json.extract! payment, :id, :bill_id, :cantidad, :created_at, :updated_at
json.url payment_url(payment, format: :json)
