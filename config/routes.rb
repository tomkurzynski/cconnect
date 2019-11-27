Rails.application.routes.draw do
  resources :weights
  resources :prices
  resources :brands
  resources :filters
    resources :orders do 
      resources:orderitems
  end

  get 'cart/index'

  resources :site_contents
  resources :categories
  resources :products
  
  
  
  devise_for :users do 
    resources :orders 
  end
  
  get '/checkout' => 'cart#createOrder'
  get '/paid/:id' => 'pages#paid'
  
  root 'pages#home'
  
  post '/search' => 'products#search'
  get '/search' => 'pages#home'
  get 'category/:title' => 'pages#category'
  get 'filter/:brand', to: 'pages#filter'

  get '/login' => 'user#login'
  get '/logout' => 'user#logout'




  get '/remove/:id' => 'cart#remove'
  get '/reduce/:id' => 'cart#reduce'
  get '/add/:id' => 'cart#add'
  get '/cart/clearcart' => 'cart#clearcart'
  get '/cart' => 'cart#index'
  get '/cart/:id' => 'cart#add'
  
  root :to => 'site#home'
  
  
  
  get '/upgrade/:id' => 'pages#upgrade'
  get '/downgrade/:id' => 'pages#downgrade'
  get '/allusers' => 'pages#allusers'
  get '/isloyal/:id' => 'pages#isloyal'
  get '/isnotloyal/:id' => 'pages#isnotloyal'
  
  get '/aboutSend/:id' => 'pages#aboutSend'  
  
  get 'dynamic_page/:title' => 'pages#dynamic_page'
  
  get 'brand/:title', to: 'pages#brand'
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
