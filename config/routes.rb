Rails.application.routes.draw do
  resources :messages do
    resources :responds
  end
  root to: "messages#index"
  resources :users
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
