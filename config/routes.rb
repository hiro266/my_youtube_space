Rails.application.routes.draw do
  root 'static_pages#top'
  resources :users, only: %i[new create]
  resources :posts, shallow: true do
    resources :comments, only: %i[create edit update destroy]
  end
  resource :profile, only: %i[show edit update]
  resources :password_resets, only: %i[new create edit update]
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  get    '/login',  to: 'user_sessions#new'
  post   '/login',  to: 'user_sessions#create'
  delete '/logout', to: 'user_sessions#destroy'
  namespace :admin do
    root 'users#index'
    get    '/login', to: 'user_sessions#new'
    post   '/login',   to: 'user_sessions#create'
    delete '/logout',  to: 'user_sessions#destroy'
    resources :users, only: %i[show edit update destroy]
    resources :boards, only: %i[index show edit update destroy]
  end
end
