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
  end
  def withdraw
  end
  def deposit
  end

  def transfer_create
    @cust = Customer.new
    @cust.balance = params[:transfer][:balance]
    @cust.save
  end

  def withdraw_create
    flag = false
    @cust = Customer.all
    if(params[:transaction][:atm_no] == @cust.atm_no && params[:transaction][:atm_pin] == @cust.atm_pin)
      flag = true
      @cust = Customer.new
      @cust.balance = params[:transaction][:balance]
      @cust.save
      format.html {redirect_to @atm, notice: 'Transaction was successfully updated.'}
    else
      flag = false
      format.html {redirect_to @transaction, notice: 'Login failed.' }
    end
  end

  def deposit_create
    @cust = Customer.new
    boolean flag = false
    @cust = Customer.all
    if(params[:index][:atm_no] == @cust.atm_no && params[:index][:atm_pin] == @cust.atm_pin)
      flag = true
      @cust.balance = params[:deposit][:balance]
      @cust.save
      format.html {redirect_to @transaction, notice: 'Login was successfully updated.' }
    else
      flag = false
      format.html {redirect_to @atm, notice: 'Transaction was successfully updated.'}
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