Rails.application.routes.draw do
  get '/', to: "welcome#index"
  get '/login_page', to: "welcome#show"

  get '/about', to: "welcome#index" 

  get '/projects', to: "projects#index"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get "/logout", to: "sessions#destroy"
  get '/profile', to: 'users#show'
end
