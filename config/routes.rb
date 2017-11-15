Rails.application.routes.draw do
  resources :genres
  resource :session

  get 'signup' => 'users#new'
  resources :users

  root "movies#index"
  get 'movies/filter/hits' => 'movies#index', filter: "hits"
  get 'movies/filter/flops' => 'movies#index', filter: "flops"

  resources :movies do
    resources :reviews
    resources :likes
  end
end
