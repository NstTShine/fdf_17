Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users, :controllers => {:omniauth_callbacks => "user/omniauth_callbacks"}
  root "products#index"


  resources :users, only: :show
  resources :products, only: [:show, :index] do
    resources :comments
  end

  namespace :admin do
    root "admin/products#index"
    resources :products, except: [:show]
    resources :categories
  end

end
