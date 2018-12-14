Rails.application.routes.draw do
  resources :order_lists
  resources :component_lists
  resources :words
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
