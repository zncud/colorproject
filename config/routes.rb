Rails.application.routes.draw do
  root 'static_pages#home'

  get '/new', to:'static_pages#new'
  
  post '/update', to:'static_pages#update'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
