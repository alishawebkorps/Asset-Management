Rails.application.routes.draw do
  root to: "product_fields#index"
  devise_for :users
  resources :product_fields
  get 'home', to: "product_fields#index"
  get 'addproduct', to: 'addproducts#addproduct'
  post 'addproduct', to: 'addproducts#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
