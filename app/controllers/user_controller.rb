class UserController < ApplicationController
    
    def login
       session[:login] = 1
       flash[:notice] = "You logged in!"
       redirect_to :controller => :items
    end
    
    def logout
       session[:login] = nil
       flash[:notice] = "You logged out!"
       redirect_to :controller =>  :items
    end
    
end
