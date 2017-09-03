class TransfersController < ApplicationController
	def transfer
    @atm = Atm.find(params[:atm_id])
    @bank = Bank.find(params[:bank_id])
  end

  def transfer_create
    new_amount = params[:transaction][:balance]
    atm_no = params[:transaction][:atm_no]
    atm_pin = params[:transaction][:atm_pin]
    receiver_atm_no = params[:transaction][:receiver_atm_no]
    transaction_type = params[:transaction][:transaction_type]
    bank_id = params[:transaction][:bank_id]
    atm_id = params[:transaction][:atm_id]
    customers = Customer.all
    flag = 0
    customers.each do |cust|
      if atm_no == cust.atm_no && atm_pin.to_i == cust.atm_pin
        flag = 1
        last_bal = cust.balance
        sended_bal = last_bal - new_amount.to_i
        Customer.find(cust.id).update(balance: sended_bal)
        break
      end
    end
    if flag == 1
      transfer = Transfer.new
      transfer.sender_id = Customer.find_by_atm_no(atm_no).id
      transfer.reciever_id = Customer.find_by_atm_no(receiver_atm_no).id
      transfer.bank_id = params[:transaction][:bank_id]
      transfer.atm_id = params[:transaction][:atm_id]
      transfer.balance = new_amount
      transfer.save


      receiver_id = transfer.reciever_id
      customer = Customer.find(receiver_id)
      receive_bal = new_amount.to_i + customer.balance


      Customer.find(transfer.receiver_id).update(balance: receive_bal)
      puts "Transaction Successfully"
      redirect_to banks_path
    else
      puts "Transaction failed"
      redirect_to transfer_transactions_path(bank_id: bank_id, atm_id: atm_id)
    end
  end
end
