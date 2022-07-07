Rails.application.routes.draw do
  get 'products', to: 'products#index'
  get 'admin', to: 'admin#index'
  get 'products/new', to: 'products#new', as: 'new_products'
  get 'products/product_details', to: 'products#product_details', as: 'product_details'
  get 'products/:id', to: 'products#show', as: :product
  get 'products/:id/edit', to: 'products#edit', as: :edit_product

  patch 'products/:id', to: 'products#update'
  post 'products', to: 'products#create'
  delete 'products/:id', to: 'products#destroy', as: :destroy_product
  
  #resources :products
  root "main#welcome"
end
