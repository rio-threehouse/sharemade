Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => :registrations }
  root to: 'toppage#index'

  resources :users, only: [:index, :show]
  resources :results do 
    resource :goods, only: [:create, :destroy]
  end
end
