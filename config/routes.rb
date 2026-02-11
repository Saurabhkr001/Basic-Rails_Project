require "sidekiq/web"

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get "up" => "rails/health#show", as: :rails_health_check

  authenticate :admin_user do
    mount Sidekiq::Web => "/sidekiq"
  end

  devise_for :users
  root "books#index"

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  resources :books do
    member do
      post "buy"
      get :purchased
    end
  end
end
