Cotclb::Application.routes.draw do
  resources :teams
  root to: 'teams#index'
end
