Rails.application.routes.draw do
  namespace :admin do
    get 'home/index'
  end
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :admin do 
    resources :authors
  end
end
