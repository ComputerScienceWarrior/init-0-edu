Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #################### STUDENT ROUTES ####################
  resources :students, only: [:index, :show, :new, :create, :edit, :update] 
  get "/signup", to: "students#new"
  post "signup", to: "students#new"
  delete '/students/:id', to: 'students#destroy'

  #################### COURSES / NESTED TOPICS ROUTES ####################
  #nested attribute to create a topic when a new course is created
  resources :courses, only: [:index, :show, :new, :create, :edit, :update] do 
    resources :topics, only: [:new]
  end
  delete '/courses/:id', to: 'courses#destroy'

  #################### TOPICS ROUTES ####################
  resources :topics, only: [:index, :show, :new, :create, :edit, :update, :delete, :destroy]

  #################### COMMENTS ROUTES ####################
  resources :comments, only: [:index, :show, :new, :create, :edit, :update, :delete, :destroy]

  #################### SESSION ROUTES ####################
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create", as: "sessions"
  get "/logout", to: "sessions#destroy"
  get 'auth/:provider/callback', to: 'sessions#googleAuth'
  get 'auth/failure', to: redirect('/')
 
  #################### ROOT ROUTE ####################
  root 'students#new'

end
