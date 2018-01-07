Rails.application.routes.draw do
  root to: 'dashboard#index'

  namespace :authentications do
    resources :magic_sessions, only: [:new, :destroy]
  end
  resources :authentications, only: [:new, :create]
  namespace :messages do
    resources :acceptances, only: [:index, :show]
  end
  resources :messages, param: :uuid

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
