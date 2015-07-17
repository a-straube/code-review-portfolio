Rails.application.routes.draw do
  devise_for :users
  get '/' => 'home#index'
  root :to => 'home#index'

  resources :skills do
    resources :projects
  end
  resources :blogs do
    resources :comments
  end
  resources :references
  resources :users
end
