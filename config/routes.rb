Rails.application.routes.draw do
  resources :tools
  root to: "tools#index"
end
