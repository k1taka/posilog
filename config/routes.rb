Rails.application.routes.draw do
  devise_for :stores, controllers: {
    sessions:      'stores/sessions',
    passwords:     'stores/passwords',
    registrations: 'stores/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  root 'logs#index'
  resources :logs do
    resources :comments, only: [:create]
    resources :store_comments, only: [:create]
    resources :log_images
  end
  resources :users,only:[:show,:edit,:update] 
  resources :stores, only:[:show,:edit,:update,:index] do
    resources :cupons, only: [:new,:index,:edit,:update]
    collection do
      get "search"
    end
  end
end
