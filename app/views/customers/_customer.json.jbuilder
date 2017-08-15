json.extract! customer, :id, :name, :mobile, :atm_number, :atm_pin, :balance, :references, :bank, :created_at, :updated_at
json.url customer_url(customer, format: :json)
