Rails.application.routes.draw do
  get 'sessions/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "dashboards#index"
  
  resources  :users 
  resources :teachers
  resources :students
  resource :session, only: %i[new create destroy]



end