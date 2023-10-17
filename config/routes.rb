Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/discs', to: 'discs#index'
  get '/discs/:id', to: 'discs#show'

  get '/discs/:id/edit', to: 'discs#edit'
  patch '/discs/:id', to: 'discs#update'
  
  get '/manufacturers', to: 'manufacturers#index'

  get 'manufacturers/new', to: 'manufacturers#new'
  post '/manufacturers', to: 'manufacturers#create'

  get '/manufacturers/:id', to: 'manufacturers#show'
  get '/manufacturers/:id/discs', to: 'manufacturers#show_discs'

  get '/manufacturers/:id/edit', to: 'manufacturers#edit'
  patch "/manufacturers/:id", to: 'manufacturers#update'

  get '/manufacturers/:id/discs/new', to: 'discs#new'
  post '/manufacturers/:id/discs', to: 'discs#create'

  delete 'manufacturers/:id', to: 'manufacturers#destroy'
  delete 'discs/:id', to: 'discs#destroy'

end
