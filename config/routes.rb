Rails.application.routes.draw do
  get 'blogs/index'
  resources :blogs
  devise_for :users
  root to: 'tweets#index'
  resources :tweets do
    resources :comments, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
  resources :users, only: :show
end