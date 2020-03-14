Rails.application.routes.draw do
  
  namespace :admin do
    resources :projects, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :projects, only: %i[index show update]
  post "/projects", to: "projects#create"
  
  get '/', to: "welcome#index"
  get '/login_page', to: "welcome#show"

  get '/about', to: "welcome#index" 

  get '/projects', to: "projects#index"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get "/logout", to: "sessions#destroy"
  get '/profile', to: 'users#show'
end
