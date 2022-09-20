Rails.application.routes.draw do
  get 'sessions/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "dashboards#index"
  
  resources  :users 
  resources :teachers
  resources :students
  resources :admins
  get "/teachers/:id", to: "teachers#show"
  get "/student/:id", to: "students#show"
  


  resource :session, only: %i[new create destroy]
  get "signup", to: "users#new"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  get "logout", to: "sessions#destroy"


end