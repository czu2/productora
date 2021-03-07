Rails.application.routes.draw do
  resources :groups
  resources :concerts, excep: [:destroy, :show]

  root 'concerts#index'
  
end
