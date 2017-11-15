Rails.application.routes.draw do
  resources :genres
  resource :session

  get 'signup' => 'users#new'
  resources :users

  root "movies#index"
  get 'movies/filter/hits' => 'movies#index', filter: "hits"

  resources :movies do
    resources :reviews
    resources :likes
  end
end
