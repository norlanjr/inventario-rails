json.extract! bill, :id, :user_id, :client_id, :estado, :total, :saldo, :fecha_limite, :created_at, :updated_at
json.url bill_url(bill, format: :json)
