Unidler::Application.routes.draw do
  root 'pages#index'
  resources :sites, only: :create
  resources :pages, only: :index
end
