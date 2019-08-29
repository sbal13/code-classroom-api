Rails.application.routes.draw do
  
  get '/login', to: 'users#login'
  resources :users
  resources :submissions
  resources :rooms

  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
