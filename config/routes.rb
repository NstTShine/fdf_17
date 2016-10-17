Rails.application.routes.draw do
  devise_for :users, :controllers => {:omniauth_callbacks => "user/omniauth_callbacks"}
  root "static_pages#show", page: "home"
  get "/*page" => "static_pages#show"

end
