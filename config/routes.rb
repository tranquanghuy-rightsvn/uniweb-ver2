Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "home#index"

  resources :websites do
    member do
      get :analytic
    end
    resources :posts, except: :show
    resources :users, except: [:show, :edit, :update]
    resources :categories
  end

  resources :attachments, only: [] do
    post :resize, on: :collection
  end

  namespace :api do
    resources :websites, only: :create
  end
end
