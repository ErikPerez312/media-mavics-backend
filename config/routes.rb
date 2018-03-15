Rails.application.routes.draw do
  # resources :users
  # resources :campaigns
  resources :video_styles
  resources :sessions

  resources :users do
    resources :campaigns
  end

  post "/ephemeral_key", to: "ephemeral_keys#create"
  post "/charge", to: "charges#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
