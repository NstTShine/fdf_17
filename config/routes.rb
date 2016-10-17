Rails.application.routes.draw do
  devise_for :users
  root "static_pages#show", page: "home"
  get "/*page" => "static_pages#show"

end
