Rails.application.routes.draw do
  resource :session

  get 'signup' => 'users#new'
  resources :users

  root "movies#index"

  resources :movies do
    resources :reviews
    resources :likes
  end
end
