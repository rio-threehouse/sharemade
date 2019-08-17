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

  resources :comments, only: [:create, :destroy]

  get '/good_ranking', to: 'goods#index'
end
