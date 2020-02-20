Rails.application.routes.draw do
  get '/', to: "welcome#index"

  get '/about', to: "welcome#index" 

  get '/projects', to: "projects#index"
end
