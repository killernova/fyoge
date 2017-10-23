Rails.application.routes.draw do

  root 'schedules#day'

  resources :sessions, only: [:create, :destroy]
  get 'login', to: 'sessions#new', as: 'login'
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users do
    collection do
      get :setting
    end
  end

  resources :courses

  resources :schedules do
    collection do
      get 'week'
      get 'day'
    end
  end
end
