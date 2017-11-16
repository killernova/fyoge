Rails.application.routes.draw do

  root 'schedules#day'

  get 'admin/login', to: 'admin/sessions#new'
  resources :sessions, only: [:create, :destroy]
  get 'login', to: 'sessions#new', as: 'login'
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users do
    collection do
      get :setting
    end
  end

  resources :courses

  resources :schedules, except: [:update] do
    collection do
      get 'week'
      get 'day'
      post 'updates'
    end
    member do
      post 'clear'
    end
  end

  get 'admin', to: 'admin/week_schedules#index'
  namespace :admin do
    resources :sessions, only: [:create, :destroy]
    resources :week_schedules, except: [:show]
    resources :courses
    resources :users
  end
end
