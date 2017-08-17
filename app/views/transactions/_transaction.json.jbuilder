json.extract! transaction, :id, :transaction_type, :balance, :customer_id, :bank_id, :atm_id, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
