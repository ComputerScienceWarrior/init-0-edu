Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :students, only: [:index, :show, :new, :create, :edit, :update, :delete, :destroy] 
  resources :teachers, only: [:index, :show, :new, :create, :edit, :update, :delete, :destroy]
  get "/signup", to: "students#new"
  post "signup", to: "students#new"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create", as: "sessions"

  #nested attribute to create a topic when a new course is created
  resources :courses, only: [:index, :show, :new, :create, :edit, :update, :delete, :destroy] do 
    resources :topics, only: [:new]
  end

  resources :topics, only: [:index, :show, :new, :create, :edit, :update, :delete, :destroy]
  resources :comments, only: [:index, :show, :new, :create, :edit, :update, :delete, :destroy]
 
  # resources :sessions, only: [:new, :create, :delete, :destroy]
  get "/logout", to: "sessions#destroy"
  root 'static#home'
end
