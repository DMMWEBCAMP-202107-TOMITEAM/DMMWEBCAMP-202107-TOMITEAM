Rails.application.routes.draw do
  # root to: 'homes#top'
  # get 'home/about' => 'homes#about'
  devise_for :clients
  devise_for :admin

  namespace :admin do
    resources :items
    resources :genres,only: [:index,:create,:edit,:update]
    resources :clients,only: [:index,:show,:edit,:update]
    resources :orders,only: [:index,:show,:update]
  end

  resources :clients,only: [:show,:edit,:update] do
  get "clients//:id" => "clients#check"
  get "clients/:id" => "clients#out"
  end

  resources :items,only: [:index,:show]

  resources :cart_items,only: [:index,:update,:create,:destroy] do
  delete "cart_items" => "cart_items#destroy_all"
  end

  resources :orders,only: [:new,:index,:create,:show] do
  get "orders" => "orders#check"
  get "orders" => "orders#thanks"
  end

  resources :adresses,only: [:index,:update,:create,:destroy,:edit]

  # get '/search', to: 'searches#search'

end
