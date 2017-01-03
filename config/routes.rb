Rails.application.routes.draw do
  # get 'example' => 'example#index'
  root to: 'static_pages#root'

  resources :tweets, only: [:index]
end
