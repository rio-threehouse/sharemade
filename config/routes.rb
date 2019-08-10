Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => :registrations }
  root to: 'toppage#index'

  resources :users, only: [:index, :show]
end
