class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]

  # GET /transactions
  # GET /transactions.json
  def index
    @atm = Atm.find(params[:atm_id])
    @bank = Bank.find(params[:bank_id])
    @cust = Customer.all
    @transactions = Transaction.all
  end

  def transfer
    @atm = Atm.find(params[:atm_id])
    @bank = Bank.find(params[:bank_id])
  end

  def withdraw
    @atm = Atm.find(params[:atm_id])
    @bank = Bank.find(params[:bank_id])
  end

  def deposit
    @atm = Atm.find(params[:atm_id])
    @bank = Bank.find(params[:bank_id])
  end

  def transfer_create
    @cust = Customer.new
    @cust.balance = params[:transfer][:balance]
    @cust.save
  end

  def withdraw_create
    atm_no = params[:transaction][:atm_no]
    atm_pin = params[:transaction][:atm_pin]
    customers = Customer.all
    flag = 0
    customers.each do |c|
      if c.atm_no == atm_no && c.atm_pin == atm_pin.to_i
        flag = 1
        break
      end
    end
    if flag == 1
      puts "balance is : "
      transaction = Transaction.new
      transaction.transaction_type = params[:transaction][:transaction_type]
      transaction.balance = params[:transaction][:balance]
      transaction.atm_id = params[:transaction][:atm_id]
      transaction.customer_id = Customer.find_by_atm_no(atm_no).id
      transaction.bank_id = params[:transaction][:bank_id]
      transaction.save
      puts "Transaction Successfully saved"
      redirect_to banks_path
    else
      redirect_to withdraw_transactions_path(atm_id: params[:transaction][:atm_id], bank_id: params[:transaction][:bank_id])
      puts "Login failed"
    end
  end

  def deposit_create
    atm_no = params[:transaction][:atm_no]
    atm_pin = params[:transaction][:atm_pin]
    deposit_amt = params[:transaction][:balance]
    customers = Customer.all
    flag = 0
    customers.each do |c|
      if atm_no == c.atm_no && atm_pin.to_i == c.atm_pin
        flag = 1
        break
      end
    end
    if flag == 1
      transaction = Transaction.new
      transaction.transaction_type = params[:transaction][:transaction_type]
      transaction.balance = deposit_amt
      transaction.customer_id = Customer.find_by_atm_no(atm_no).id
      transaction.bank_id = params[:transaction][:bank_id]
      transaction.atm_id = params[:transaction][:atm_id]
      transaction.save
      puts "Transaction successfully"
      redirect_to banks_path
    else
      puts "login failed"
      redirect_to deposit_transactions_path(atm_id: params[:transaction][:atm_id], bank_id: params[:transaction][:bank_id])
    end
  end

  def login
    boolean flag = false
    @cust = Customer.all
    if(params[:index][:atm_no] == @cust.atm_no && params[:index][:atm_pin] == @cust.atm_pin)
      flag = true
      format.html {redirect_to @transaction, notice: 'Login was successfully updated.' }
    else
      flag = false
      format.html {redirect_to @atm, notice: 'Transaction was successfully updated.'}
    end
  end
  # GET /transactions/1
  # GET /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = Transaction.new
    @transaction.balance = params[:index][:balance]
    @transaction.transaction_type = params[:index][:transaction]
    @transaction.save
  end


  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, notice: 'Transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction).permit(:transaction_type, :balance, :customer_id, :bank_id, :atm_id)
    end
end