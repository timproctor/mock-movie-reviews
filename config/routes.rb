Rails.application.routes.draw do
  resources :genres
  resource :session

  get 'signup' => 'users#new'
  resources :users

  root "movies#index"

  get "movies/filter/hits" => "movies#index", scope: "hits"
  get "movies/filter/flops" => "movies#index", scope: "flops"

  resources :movies do
    resources :reviews
    resources :likes
  end
end
