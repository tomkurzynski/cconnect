class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
   before_action :configure_permitted_parameters, if: :devise_controller?
  
  before_filter :commonMethod 
  
  def commonMethod
    @prices = Price.all
    @products = Product.all
    @categories = Category.all
    @brands = Brand.all
    @weights = Weight.all

     #@carts = Cart.all
  

  end
  



     protected

          def configure_permitted_parameters
               devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password)}

               devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password)}
          end



end