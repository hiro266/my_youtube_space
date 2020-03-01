Rails.application.routes.draw do
  root 'static_pages#top'
  resources :users, only: %i[new create]
  resources :posts, shallow: true do
    resources :comments, only: %i[create edit update destroy]
  end
  resource :profile, only: %i[show edit update]
  get    '/login',  to: 'user_sessions#new'
  post   '/login',  to: 'user_sessions#create'
  delete '/logout', to: 'user_sessions#destroy'
end
