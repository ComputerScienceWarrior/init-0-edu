Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :students, only: [:index, :show, :new, :create, :edit, :update, :delete, :destroy] 
  resources :teachers, only: [:index, :show, :new, :create, :edit, :update, :delete, :destroy]
  resources :courses, only: [:index, :show, :new, :create, :edit, :update, :delete, :destroy]
  resources :topics, only: [:index, :show, :new, :create, :edit, :update, :delete, :destroy]
  resources :comments, only: [:index, :show, :new, :create, :edit, :update, :delete, :destroy]
  root 'static#home'
end
