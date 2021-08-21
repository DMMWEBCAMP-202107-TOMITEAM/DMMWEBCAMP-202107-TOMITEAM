Rails.application.routes.draw do
  root to: 'homes#top'
  get 'home/about' => 'homes#about'

  devise_for :client, controllers: {
    sessions:      'client/sessions',
    passwords:     'client/passwords',
    registrations: 'client/registrations'
  }

  devise_for :admin, controllers: {
    sessions:      'admin/sessions',
    passwords:     'admin/passwords',
    registrations: 'admin/registrations'
  }

  namespace :admin do

    get "top" => "orders#index"

    resources :items
    resources :genres,only: [:index,:create,:edit,:update]
    resources :clients,only: [:index,:show,:edit,:update]
    resources :orders,only: [:index,:show,:update]
  end

  scope module: "client" do
    resource :clients,only: [:edit,:update]
    get "clients/my_page" => "clients#show"
    get "clients/check" => "clients#check"
    patch "clients/out" => "clients#out"

    resources :items,only: [:index,:show]

    resources :cart_items,only: [:index,:update,:create,:destroy] do
      delete "destroy_all"
    end

    resources :orders,only: [:index,:create,:show]
    get "orders/new" => "orders#new"
    post "orders/check" => "orders#check"
    get "thanks" => "orders#thanks"

    resources :adresses,only: [:index,:update,:create,:destroy,:edit]

    get '/search', to: 'searches#search'
 end



end
