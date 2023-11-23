Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "home#index"

  resources :websites do
    get :analytic
    get :general
    get :images
    get :domain
    get :store
    patch :store, to: 'stores#update_store'
    patch :setting_analytic
    resources :posts, except: :show
    resources :products, except: :show
    resources :users, except: [:show, :edit, :update]
    resources :categories
    resources :orders, only: [:show, :index, :update]
  end

  resources :map_images, only: :update
  resources :stores, only: [] do
    member do
      resources :banks, only: [:create, :update]
    end
  end

  namespace :api do
    resources :websites, only: :create
    resources :search, only: :index
    resources :orders, only: :create
    resources :lazyload, only: :index
  end

  namespace :superadmin do
    resources :websites, only: :index
    resources :repos
  end
end
