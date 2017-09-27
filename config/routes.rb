Rails.application.routes.draw do
  root 'home#index'
  
  resources :schedules, only: [] do
    collection do
      get 'week'
      get 'day'
    end
  end
end
