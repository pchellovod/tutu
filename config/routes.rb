Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  root 'welcome#index'

  resource :search, only: [:create, :show]
  resources :tickets, only: [:new, :create, :show]

namespace :admin do
    resources :railway_stations do
      patch :update_position, on: :member
      patch :update_time, on: :member
    end
    resources :routes
    resources :trains do
      resources :carriages, shallow: true
    end
    resources :tickets
end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
