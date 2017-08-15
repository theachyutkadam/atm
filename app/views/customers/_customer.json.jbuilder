json.extract! customer, :id, :name, :mobile, :atm_no, :atm_pin, :bank_id, :balance, :created_at, :updated_at
json.url customer_url(customer, format: :json)
