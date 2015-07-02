Rails.application.routes.draw do
  resources :skills do
    resources :projets
  end
end
