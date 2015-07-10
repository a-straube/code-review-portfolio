Rails.application.routes.draw do
  root :to => 'skills#index'

  resources :skills do
    resources :projects
  end
  resources :blogs do
    resources :comments
  end
end
