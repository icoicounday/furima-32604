Rails.application.routes.draw do
  get 'order/index'
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :orders
  end
end
