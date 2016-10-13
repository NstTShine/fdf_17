Rails.application.routes.draw do
  root "static_pages#show", page: "home"
  get "/*page" => "static_pages#show"
end
