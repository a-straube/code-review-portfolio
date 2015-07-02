Rails.application.routes.draw do
  root :to => 'skills#index'

  resources :skills do
    resources :projets
  end
end
