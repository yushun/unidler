Unidler::Application.routes.draw do
  root 'sites#index'
  resources :sites, only: [:index, :create]
end
