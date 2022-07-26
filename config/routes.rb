Rails.application.routes.draw do
  #get 'checkouts/show'
  namespace :shop_carts do
    resource :adds, only: :create
    resource :reduce, only: :create
    resource :remove, only: :destroy
    resource :stripe, only: :create
  end
  resource :checkout, only: :show
  devise_for :users
  resources :categories
  get 'admin', to: 'admin#index'
  get 'products/product_details', to: 'products#product_details', as: 'product_details'
  #post 'products', to: 'products#create'
  resources :products do 
    member do
      get 'show_detail', to: 'products#show_detail', as: :show_detail
    end
  end
  root "main#welcome"
end
