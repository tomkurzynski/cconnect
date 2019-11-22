class PagesController < ApplicationController
  def home
    #current_user.update_attribute :admin, true
    @categories = Category.all
    @products = Product.all
  end
  
  def dynamic_page 
    catName = params[:title] 
    @site_contents = SiteContent.where("title like ? ", catName) 
    
  end
  
  
  def allusers
    @users = User.all
  end
  
  def upgrade
    @user = User.find_by(id: params[:id])
    @user.update_attribute(:admin, true)
    redirect_to "/"
  end
  
  def downgrade
    @user = User.find_by(id: params[:id])
    @user.update_attribute(:admin, false)
    redirect_to "/"
  end
  def category
    catName = params[:title]
    @products = 
    Product.where("category like ? ", catName)
  end
  
def paid
    # redirect_to "/cart/clear"
    flash[:notice] = 'Transaction Complete'
    @order = Order.last
    @order.update_attribute(:status , "Paid by User: #{current_user.email}")
    #"Paid by User:#{current_user.id} #{current_user.name} #{current_user.surname}")
    
  end





  
  
end
