Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'

  get '/login' => 'user#login'
  get '/logout' => 'user#logout'
  
  root :to => 'site#home'
  
  get '/upgrade/:id' => 'static_pages#upgrade'
  get '/downgrade/:id' => 'static_pages#downgrade'
  get '/allusers' => 'pages#allusers'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
