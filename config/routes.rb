Rails.application.routes.draw do

  resources :products

  root to: 'products#call_product'
  post '/request_product', to: 'products#request_product'

end
