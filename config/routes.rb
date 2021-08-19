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

    resources :cart_items,only: [:index,:update,:create,:destroy]
    delete "cart_items_all" => "cart_items_all#destroy"

    resources :orders,only: [:new,:index,:create,:show]
    get "orders" => "orders#check"
    get "orders" => "orders#thanks"

    resources :adresses,only: [:index,:update,:create,:destroy,:edit]
 end

  # get '/search', to: 'searches#search'

end
