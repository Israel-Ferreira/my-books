# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :admin do
    get 'home/index'
    resources :authors, :categories, :publishers
    resources :books
    resources :users do
      collection do
        get :admins
      end
    end
  end

  root to: 'home#index'
end
