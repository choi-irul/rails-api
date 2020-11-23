# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :users, only: %w[show create]

    resources :authentication, path: 'auth', only: %w[index] do
      collection do
        post 'login', to: 'authentication#login'
      end
    end
  end


  # post '/auth/login', to: 'authentication#login'
  # get '/*a', to: 'application#not_found'
end
