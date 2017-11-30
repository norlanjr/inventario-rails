json.extract! detail_invoice, :id, :bill_id, :article_id, :cantidad, :sub_total, :created_at, :updated_at
json.url detail_invoice_url(detail_invoice, format: :json)
