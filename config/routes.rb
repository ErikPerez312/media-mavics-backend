Rails.application.routes.draw do
  # resources :users
  # resources :campaigns
  resources :video_styles
  resources :sessions

  resources :users do
    resources :campaigns
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
