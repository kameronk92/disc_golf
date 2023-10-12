Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/discs', to: 'discs#index'
  get '/discs/:id', to: 'discs#show'
  get '/manufacturers', to: 'manufacturers#index'

end
