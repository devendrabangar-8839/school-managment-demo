Rails.application.routes.draw do
  get 'sessions/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "dashboards#index"
  
  resources  :users 
  resources :admins
  resources :teachers
  resources :students
  resources :student_teachers
  get "/teachers/:id", to: "teachers#show"
  get "/student/:id", to: "students#show" , only: [:show]
  delete "/students/:id", to: "students#destroy"
  delete "session", to: "sessions#new"

  get "dashboards" , to: "dashboards#show"
  


  resource :session, only: %i[new create destroy]
  get "signup", to: "users#new"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  get "logout", to: "sessions#destroy"


end