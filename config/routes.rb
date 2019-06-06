Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/update', to: 'clients#update_client'
  get '/activate', to: 'clients#activate'
  get '/deactivate', to: 'clients#deactivate'
  resources :clients
end
