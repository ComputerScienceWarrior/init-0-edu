Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #################### ADMIN ROUTES ####################
  namespace :admin do
    resources :students, only: [:index, :show, :destroy] do
      resources :comments
    end
    resources :comments, only: [:index, :destroy]
    resources :courses do
      resources :comments
      resources :topics
    end
    resources :topics, only: [:index, :show, :edit, :update, :destroy]
  end
  get "/admin/courses/:course_id/topics/new", to: "admin/topics#new"
  post "/admin/courses/:course_id/topics/new", to: "admin/topics#create"
  post "admin/courses/:course_id/comments/new", to: "admin/comments#create"
  
  #################### STUDENT ROUTES ####################
  resources :students, only: [:show, :new, :create, :edit, :update] 
  get "/signup", to: "students#new"
  post "signup", to: "students#new"
  delete '/students/:id', to: 'students#destroy'

  resources :students do
    resources :comments, only: [:index, :new, :edit]
  end
 
  #################### COURSES / NESTED TOPICS ROUTES ####################
  resources :courses, only: [:index, :show] do 
    resources :topics, only: [:index, :show]
  end
  delete '/courses/:id', to: 'courses#destroy'

  #################### TOPICS ROUTES ####################
  resources :topics, only: [:index, :show]

  #################### COMMENTS ROUTES ####################
  resources :courses, only: [:index, :show] do 
    resources :comments, only: [:index, :new, :show]
  end

  resources :comments

  #################### SESSION ROUTES ####################
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create", as: "sessions"
  get "/logout", to: "sessions#destroy"
  get 'auth/:provider/callback', to: 'sessions#googleAuth'
  get 'auth/failure', to: redirect('/')
 
  #################### ROOT ROUTE ####################
  root 'students#new'

end
