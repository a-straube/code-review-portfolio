Rails.application.routes.draw do
  root :to => 'blogs#index'

  resources :skills do
    resources :projects
  end
  resources :blogs do
    resources :comments
  end
end
