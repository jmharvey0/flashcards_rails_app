Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  root to: "decks#index"

  # get '/decks/:id', to: 'decks#show', as: "deck"


  resources :decks, only: [:show] do
    resources :rounds
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#delete'
end
