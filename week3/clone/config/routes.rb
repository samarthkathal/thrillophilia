Rails.application.routes.draw do

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  devise_for :users
  resources :posts do 
    member do
      get "like",     to: "posts#upvote"
      get "dislike",   to: "posts#downvote"
    end
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"
end
