Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users, :controllers => {:omniauth_callbacks => "user/omniauth_callbacks"}
  root "products#index"
  get "/*page" => "static_pages#show"

  resources :users, only: :show
  resources :products

end
