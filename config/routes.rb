Rails.application.routes.draw do

  post '/register', to: 'users#create'
  post '/login', to: 'sessions#login'
  get '/blogs', to: 'blogs#index'
  get '/new_blog', to: 'blogs#create'

end
