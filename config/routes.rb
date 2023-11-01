# Malyk Ratelle, le 18 octobre 2023
# Modifié le 1 novembre 2023 par Malyk Ratelle

Rails.application.routes.draw do
  devise_for :users

  root to: "home#index"

  get '/businesses/:id', to: 'business#display', as: 'business'

  get '/mesmenus', to: 'mesmenus#index', as: 'mesmenus'
  get '/mesmenus/:id', to: 'mesmenus#display', as: 'monmenu'

  namespace :admin do
    get '/', to: 'home#index'
    get '/businesses/:id', to: 'business#display', as: 'business'
  end
end
