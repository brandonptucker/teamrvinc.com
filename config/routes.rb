TeamRV::Application.routes.draw do
  
  root :to => "pages#home"
  match "contact" => "pages#contact"
end
