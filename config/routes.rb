Cotclb::Application.routes.draw do
  match "/auth/:provider/callback" => "sessions#create", via: :all
  match "/auth/failure" => "sessions#signin_failed", via: :all
  delete "/session" => "sessions#destroy", as: 'logout'
  
  resources :teams
  root to: 'teams#index'
end
