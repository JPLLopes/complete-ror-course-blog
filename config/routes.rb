Rails.application.routes.draw do
  root "pages#home"

  #Pages
  get "/about", to: "pages#about"

  resources :articles
end
