Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'product#show'
  # get '/purchase/name/amount', to: 'product#purchase'
  # get '/products/option', to: 'product#products'
  get '/products/', to: 'product#products'
  resources :product
end
