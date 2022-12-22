require 'sidekiq/web'

Rails.application.routes.draw do
  get 'tweets/index'
  get 'tweets/create'
  get 'tweets/destroy'
    authenticate :user, lambda { |u| u.admin? } do
      mount Sidekiq::Web => '/sidekiq'
    end


  devise_for :users
  resources :tweets, except: [:edit, :update]
  root to: 'tweets#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
