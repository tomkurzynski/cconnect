class ShippingsController < ApplicationController
  before_action :set_shipping, only: [:show, :edit, :update, :destroy]

  # GET /shippings
  # GET /shippings.json
  # def index
  
  #   if user_signed_in? && current_user.admin?
  #   @shippings = Shipping.all
    
  #   else
  #   redirect_to '/'
  #   flash[:notice] = "You don't have permission to view this page"
  #   end
   
  # end
  
  def index
    if user_signed_in? && current_user.admin?
      @shippings = Shipping.all
    
    elsif user_signed_in?
    @shippings = Shipping.where(:clientId => current_user.id)
    
    else
    redirect_to '/'
    end
     
  end

  # GET /shippings/1
  # GET /shippings/1.json
  def show
  end

  # GET /shippings/new
  def new
    if user_signed_in?
    
    @shipping = Shipping.new
 
    else
    redirect_to '/users/sign_in'
    flash[:notice] = "You need to be signed in to add shipping address"
    end
    
  end

  # GET /shippings/1/edit
  def edit
       if user_signed_in? 
    @shippings = Shipping.all
    else
    redirect_to '/'
    flash[:notice] = "You don't have permission to view this page"
    end
    
  end

  # POST /shippings
  # POST /shippings.json
  def create
    @shipping = Shipping.new(shipping_params)

    respond_to do |format|
      if @shipping.save
        format.html { redirect_to @shipping, notice: 'Shipping address was successfully saved.' }
        format.json { render :show, status: :created, location: @shipping }
      else
        format.html { render :new }
        format.json { render json: @shipping.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shippings/1
  # PATCH/PUT /shippings/1.json
  def update
    respond_to do |format|
      if @shipping.update(shipping_params)
        format.html { redirect_to @shipping, notice: 'Shipping was successfully updated.' }
        format.json { render :show, status: :ok, location: @shipping }
      else
        format.html { render :edit }
        format.json { render json: @shipping.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shippings/1
  # DELETE /shippings/1.json
  def destroy
    @shipping.destroy
    respond_to do |format|
      format.html { redirect_to shippings_url, notice: 'Shipping was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shipping
      @shipping = Shipping.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shipping_params
      params.require(:shipping).permit(:Line_1, :Line_2, :Line_3, :clientId)
    end
end
