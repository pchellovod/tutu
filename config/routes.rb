Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  root 'welcome#index'

  resources :trains do
    resources :carriages, shallow: true
  end
  resources :railway_stations do
    patch :update_position, on: :member
    patch :update_time, on: :member
  end
  resources :routes
  resources :carriages
  resources :tickets, only: [:create, :show]
  resource :search, only: [:create, :show]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
