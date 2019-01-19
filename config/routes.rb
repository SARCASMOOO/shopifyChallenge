Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'product#products'
  post '/purchase', to: 'product#purchase'
  get '/products', to: 'product#products'
  get '/product', to: 'product#product'
  resources:products
end
