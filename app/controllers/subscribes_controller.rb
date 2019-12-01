class SubscribesController < ApplicationController
  before_action :set_subscribe, only: [:show, :edit, :update, :destroy]

  # GET /subscribes
  # GET /subscribes.json
  def index
    if user_signed_in? && current_user.admin?
    @subscribes = Subscribe.all
    else
    redirect_to '/'
    end
  end

  # GET /subscribes/1
  # GET /subscribes/1.json
  def show
    @products=Product.all
  end

  # GET /subscribes/new
  def new
    @subscribe = Subscribe.new
  end

  # GET /subscribes/1/edit
  def edit
    if user_signed_in? && current_user.admin?
      @subscribes = Subscribe.all
    else
      redirect_to '/'
    end
    
    
  end

  # POST /subscribes
  # POST /subscribes.json
  def create
    @subscribe = Subscribe.new(subscribe_params)

    respond_to do |format|
      if @subscribe.save
        format.html { redirect_to @subscribe, notice: 'Subscribe was successfully created.' }
        format.json { render :show, status: :created, location: @subscribe }
      else
        format.html { render :new }
        format.json { render json: @subscribe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subscribes/1
  # PATCH/PUT /subscribes/1.json
  def update
    respond_to do |format|
      if @subscribe.update(subscribe_params)
        format.html { redirect_to @subscribe, notice: 'Subscribe was successfully updated.' }
        format.json { render :show, status: :ok, location: @subscribe }
      else
        format.html { render :edit }
        format.json { render json: @subscribe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subscribes/1
  # DELETE /subscribes/1.json
  def destroy
    @subscribe.destroy
    respond_to do |format|
      format.html { redirect_to subscribes_url, notice: 'Subscribe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscribe
      @subscribe = Subscribe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subscribe_params
      params.require(:subscribe).permit(:email)
    end
end
