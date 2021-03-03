Rails.application.routes.draw do
  root 'static_pages#home'

  get '/new', to:'static_pages#new'

  get '/random', to:'static_pages#random'
  
  post '/update', to:'static_pages#update'

  post '/saveDB', to:'static_pages#saveDB'

  delete '/deleteColor', to:'static_pages#deleteColor'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
