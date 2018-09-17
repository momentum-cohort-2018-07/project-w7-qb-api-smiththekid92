Rails.application.routes.draw do

  resource :session, only: [:new, :create, :destroy]

  # get 'users/new'
  # resources :users


  resources :users
  
  resources :questions do 
    resources :answers
  end

  root 'questions#index'

  namespace :api do
    namespace :v1 do
      resources :users
      resources :questions do 
      resources :answers
     end
    end
  end

end