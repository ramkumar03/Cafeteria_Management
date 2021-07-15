Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "menu_categories", to: "menu_categories#index"

  resources :users
end
