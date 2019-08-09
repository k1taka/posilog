Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'logs#index'
  resources :logs do
    resources :comments, only: [:create]
  end
  resources :users

end
