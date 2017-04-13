Rails.application.routes.draw do
  resources :genres
  resource :session

  get 'signup' => 'users#new'
  resources :users

  root "movies#index"

  resources :movies do
    resources :reviews
    resources :likes
  end
end
