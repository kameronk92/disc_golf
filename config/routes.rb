Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/discs', to: 'discs#index'
  get '/discs/:id', to: 'discs#show'
  
  get '/manufacturers', to: 'manufacturers#index'

  get 'manufacturers/new', to: 'manufacturers#new'
  post '/manufacturers', to: 'manufacturers#create'

  get '/manufacturers/:id', to: 'manufacturers#show'
  get '/manufacturers/:id/discs', to: 'manufacturers#show_discs'

  get '/manufacturers/:id/edit', to: 'manufacturers#edit'
  patch "/manufacturers", to: 'manufacturers#update'

end
