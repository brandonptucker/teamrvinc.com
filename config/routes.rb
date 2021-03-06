TeamRV::Application.routes.draw do

  root :to => "pages#home"

  match "contact" => "pages#contact", :as => "contact", :via => :get
  match "send_contact_message" => "pages#send_contact_message"
  match "send_service_appointment" => "services#send_service_appointment"
  match "send_rv_request" => "rvs#send_rv_request"
  match "rv_report" => "rvs#rv_report"
  match "sitemap.xml" => "sitemap#index", :as => "sitemap", :defaults => {:format => "xml"}

  match "/login",  to: "sessions#new"
  match "/logout", to: "sessions#destroy", via: :delete

  resources :sessions, only: [:new, :create, :destroy]
  resources :services
  resources :parts
  resources :rvs
end
