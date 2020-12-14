Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :students, only: [:index, :show, :new, :create, :edit, :update, :delete, :destroy] 
  resources :teachers, only: [:index, :show, :new, :create, :edit, :update, :delete, :destroy]
  resources :courses, only: [:index, :show, :new, :create, :edit, :update, :delete, :destroy] do 
    resources :topics, only: [:new]
  end
  resources :topics, only: [:index, :show, :new, :create, :edit, :update, :delete, :destroy]
  resources :comments, only: [:index, :show, :new, :create, :edit, :update, :delete, :destroy]
  get "/login", to: "sessions#new"
  get "/login", to: "sessions#create"
  root 'static#home'
end
