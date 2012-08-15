TeamRV::Application.routes.draw do
  
  root :to => "pages#home"
  # match "contact" => "pages#contact"
  match 'contact' => 'pages#contact', :as => 'contact', :via => :get
  match 'contact' => 'pages#send_contact_message', :as => 'contact', :via => :post

  match "/login",  to: "sessions#new"
  match "/logout", to: "sessions#destroy", via: :delete

  resources :sessions, only: [:new, :create, :destroy]
end
