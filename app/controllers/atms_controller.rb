class AtmsController < ApplicationController
  before_action :set_atm, only: [:show, :edit, :update, :destroy]

  # GET /atms
  # GET /atms.json
  def index
    @atms = Atm.all
  end

  # GET /atms/1
  # GET /atms/1.json
  def show
  end

  # GET /atms/new
  def new
    @atm = Atm.new
  end

  # GET /atms/1/edit
  def edit
  end

  # POST /atms
  # POST /atms.json
  def create
    @atm = Atm.new(atm_params)

    respond_to do |format|
      if @atm.save
        format.html { redirect_to @atm, notice: 'Atm was successfully created.' }
        format.json { render :show, status: :created, location: @atm }
      else
        format.html { render :new }
        format.json { render json: @atm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /atms/1
  # PATCH/PUT /atms/1.json
  def update
    respond_to do |format|
      if @atm.update(atm_params)
        format.html { redirect_to @atm, notice: 'Atm was successfully updated.' }
        format.json { render :show, status: :ok, location: @atm }
      else
        format.html { render :edit }
        format.json { render json: @atm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /atms/1
  # DELETE /atms/1.json
  def destroy
    @atm.destroy
    respond_to do |format|
      format.html { redirect_to atms_url, notice: 'Atm was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_atm
      @atm = Atm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def atm_params
      params.require(:atm).permit(:bank_id, :location)
    end
end
