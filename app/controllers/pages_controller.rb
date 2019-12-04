class PagesController < ApplicationController
  def home
    #current_user.update_attribute :admin, true
    @categories = Category.all
    @products = Product.all
    @contactforms = Contactform.all
    @subscribes = Subscribe.all
    @brands = Brand.all
    @prices = Price.all
    @weights = Weight.all
    if user_signed_in?
    @user = User.find(current_user.id)
    @orderitems = Orderitem.where(order_id: @user.orders.last)
    end
    # =>session[:cart] = nil

  end
  

  
  def dynamic_page 
 
   
    catName = params[:title] 
    @site_contents = SiteContent.where("title like ? ", catName)
    
    @contactforms = Contactform.new
    

  end
  
 
# def shippingaddr
#   @users = User.all
# end
  
  
  def allusers
    if  user_signed_in? && current_user.admin?
    @users = User.all
    else
    redirect_to '/'
    flash[:notice] = "You don't have permissions to view this page."
    end
  end
  
  def upgrade
    @user = User.find_by(id: params[:id])
    @user.update_attribute(:admin, true)
    redirect_to "/allusers"
  end
  
  def downgrade
    @user = User.find_by(id: params[:id])
    @user.update_attribute(:admin, false)
    redirect_to "/allusers"
  end
  
  def isloyal
    @user = User.find_by(id: params[:id])
    @user.update_attribute(:loyalcust, true)
    redirect_to "/allusers"
  end
  
  def isnotloyal
    @user = User.find(id: params[:id])
    @user.update_attribute(:loyalcust, false)
    redirect_to "/allusers"
  end
  
  def category
    catName = params[:title]
    @products = Product.where("category like ? ", catName)
    @cat_name = catName
  end

  
  def aboutSend
@order = Order.find(params[:id])
@order.update_attribute(:status, "Paid with Paypal")
redirect_to '/cart/clearcart'


  end
  
def paid
    
    # redirect_to "/cart/clear"
    flash[:notice] = 'Transaction Complete'
    @order = Order.last
    @order.update_attribute(:status , "Paid by User: #{current_user.email}")
    #"Paid by User:#{current_user.id} #{current_user.name} #{current_user.surname}")
    
end

def brand
    brandName = params[:title]
    @products = Product.where("brand like ? ", brandName)
    @brand_name = brandName
end

def price
    price1 = params[:value]
    price2 = price1.to_f + 20
    @products = Product.where("price >= ? AND price <= ?", price1, price2)
    @price1 = price1
    @price2 = price2.to_i
end

def weight
    weight1 = params[:value]
    weight2 = weight1.to_f + 2
    @products = Product.where("weight >= ? AND weight <= ?", weight1, weight2)
    @weight1 = weight1
    @weight2 = weight2.to_i
end

def testprice
    val = params[:value]
    val2 = params[:value]
    @products = Product.where("price >= ? AND price <= ?", val, val2)
end










end
