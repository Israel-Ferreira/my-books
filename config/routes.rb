# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :admin do
    get 'home/index'
    resources :authors
    resources :categories
  end

  root to: 'home#index'
end
