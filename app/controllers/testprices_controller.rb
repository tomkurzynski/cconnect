class TestpricesController < ApplicationController
  before_action :set_testprice, only: [:show, :edit, :update, :destroy]

  # GET /testprices
  # GET /testprices.json
  def index
    @testprices = Testprice.all
  end

  # GET /testprices/1
  # GET /testprices/1.json
  def show
  end

  # GET /testprices/new
  def new
    @testprice = Testprice.new
  end

  # GET /testprices/1/edit
  def edit
  end

  # POST /testprices
  # POST /testprices.json
  def create
    @testprice = Testprice.new(testprice_params)

    respond_to do |format|
      if @testprice.save
        format.html { redirect_to @testprice, notice: 'Testprice was successfully created.' }
        format.json { render :show, status: :created, location: @testprice }
      else
        format.html { render :new }
        format.json { render json: @testprice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /testprices/1
  # PATCH/PUT /testprices/1.json
  def update
    respond_to do |format|
      if @testprice.update(testprice_params)
        format.html { redirect_to @testprice, notice: 'Testprice was successfully updated.' }
        format.json { render :show, status: :ok, location: @testprice }
      else
        format.html { render :edit }
        format.json { render json: @testprice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /testprices/1
  # DELETE /testprices/1.json
  def destroy
    @testprice.destroy
    respond_to do |format|
      format.html { redirect_to testprices_url, notice: 'Testprice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_testprice
      @testprice = Testprice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def testprice_params
      params.require(:testprice).permit(:title, :value, :value2)
    end
end
