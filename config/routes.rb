require 'sidekiq/web'


Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check


  # 2. Wrap the mount in a constraint that checks for username/password
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  devise_for :users
  root "books#index"

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?


  resources :books do
    member do
      post 'buy' # Creates POST /books/:id/buy
      get :purchased
    end
  end
  
end