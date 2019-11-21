Rails.application.routes.draw do
  get 'cart/index'

  resources :site_contents
  resources :categories
  resources :products
  devise_for:users
  
  root 'pages#home'
  
  post '/search' => 'products#search'
  get '/search' => 'pages#home'
  get 'category/:title' => 'pages#category'


  get '/login' => 'user#login'
  get '/logout' => 'user#logout'



  get '/checkout' => 'cart#createOrder' 
  get '/remove/:id' => 'cart#remove'
  get '/reduce/:id' => 'cart#reduce'
  get '/add/:id' => 'cart#add'
  get '/cart/clearcart' => 'cart#clearcart'
  get '/cart' => 'cart#index'
  get '/cart/:id' => 'cart#add'
  
  root :to => 'site#home'
  
  get '/upgrade/:id' => 'static_pages#upgrade'
  get '/downgrade/:id' => 'static_pages#downgrade'
  get '/allusers' => 'pages#allusers'
  
  get 'dynamic_page/:title' => 'pages#dynamic_page'
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
