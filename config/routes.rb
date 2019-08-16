Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => :registrations }
  root to: 'toppage#index'

  resources :users, only: [:index, :show] do 
    member do
      get :goods
    end
  end

  resources :results do 
    resource :goods, only: [:create, :destroy]
  end

  get '/goods', to: 'goods#index'
end
