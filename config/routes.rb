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
  end
  resources :users
  resources :stores, only:[:show] do
    collection do
      get "search"
    end
  end
end
