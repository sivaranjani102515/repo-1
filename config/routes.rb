Rails.application.routes.draw do
  #get 'checkouts/show'
  resource :checkout, only: :show
  namespace :shop_carts do
    resource :adds, only: :create
    resource :reduce, only: :create
    resource :remove, only: :destroy
  end
  devise_for :users
  resources :categories
  #get 'products', to: 'products#index'
  get 'admin', to: 'admin#index'
  #get 'products/new', to: 'products#new', as: 'new_product'
  get 'products/product_details', to: 'products#product_details', as: 'product_details'
  #get 'products/:id', to: 'products#show', as: :product
  #get 'products/:id/edit', to: 'products#edit', as: :edit_product

  #patch 'products/:id', to: 'products#update'
  #post 'products', to: 'products#create'
  #delete 'products/:id', to: 'products#destroy', as: :destroy_product

  #get 'products/:id', to: 'products#show_detail', as: :product_show_detail
  
  resources :products do 
    member do
      get 'show_detail', to: 'products#show_detail', as: :show_detail
    end
  end
  root "main#welcome"
end
