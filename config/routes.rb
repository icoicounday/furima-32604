Rails.application.routes.draw do
  devise_for :users
  get 'items/index'
  # get 'furima/index'
  root to: "items#index"
end
