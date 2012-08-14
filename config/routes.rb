TeamRV::Application.routes.draw do
  
  root :to => "pages#home"
  match "contact" => "pages#contact"

  match "/login",  to: "sessions#new"
  match "/logout", to: "sessions#destroy", via: :delete

  resources :sessions, only: [:new, :create, :destroy]
end
