Rails.application.routes.draw do
  
  resources :user_cohorts
  namespace :api do
    namespace :v1 do
      post '/login', to: 'auth#login'
      get '/auto_login', to: "auth#auto_login"
      
      resources :cohorts
      resources :users
      resources :submissions
      resources :rooms 
    end
  end

  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
